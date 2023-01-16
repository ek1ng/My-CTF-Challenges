 

HGAME2023-v2board

> flag: hgame{39d580e71705f6abac9a414def74c466}

可以参考文章https://www.ctfiot.com/86202.html

V2board是一个多用户代理工具管理面板。这是一个2022年12月暴露出来的漏洞，漏洞本身影响范围比较广，危害不小，复现的难度也比较低，网上有很多复现的文章，因此出成题目让大家了解一下越权漏洞，在这个题目中的情形是可以从普通用户越权到管理员用户。

漏洞产生的原因很简单，在1.6.1版本中，引入了对于用户Session的缓存机制，当以普通用户的身份请求过个人信息接口后，会被加入到redis缓存中，而鉴权部分的逻辑是只要在redis缓存中有这个用户的信息，那么就可以直接请求管理员接口，而不会判断是否是管理员。

鉴权部分的文件在https://github.com/v2board/v2board的`app/Http/Middleware/Admin.php`中，

![image-20230109200349968](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301092003077.png)

来详细看一下这个[commit](https://github.com/v2board/v2board/commit/adf465696af9f0de9d5cb015d1a28915c5cfb22e)提交的代码为什么会引入这个漏洞

```php
class Admin
{
	public function handle($request, Closure $next)
        if (!$authorization) abort(403, '未登录或登陆已过期');

        $authData = explode(':', base64_decode($authorization));
        if (!Cache::has($authorization)) {
            if (!isset($authData[1]) || !isset($authData[0])) abort(403, '鉴权失败，请重新登入');
            $user = \App\Models\User::where('password', $authData[1])
                ->where('email', $authData[0])
                ->select([
                    'id',
                    'email',
                    'is_admin',
                    'is_staff'
                ])
                ->first();
            if (!$user) abort(403, '鉴权失败，请重新登入');
            if (!$user->is_admin) abort(403, '鉴权失败，请重新登入');
            Cache::put($authorization, $user->toArray(), 3600);
        }
        $request->merge([
            'user' => Cache::get($authorization)
        ]);
        return $next($request);
    }
```

这里只判断了Cache中是否有这个请求过来的身份信息`authorization`而并没有判断具体身份，导致只要用户信息在缓存中，就可以请求到管理员接口。

然后我们再来看看这里是如何修复的，具体修复对应[commit](https://github.com/v2board/v2board/commit/5976bcc65a61f7942ed4074b9274236d9d55d5f0)

```php

public function handle($request, Closure $next)
        $authorization = $request->input('auth_data') ?? $request->header('authorization');
        if (!$authorization) abort(403, '未登录或登陆已过期');

        $user = AuthService::decryptAuthData($authorization);
        if (!$user || !$user['is_admin']) abort(403, '未登录或登陆已过期');
        $request->merge([
            'user' => $user
        ]);
        return $next($request);
    }
```

修复也非常简单，就是在获取到身份信息`authorization`后对是否为`admin`进行判断。

这个漏洞造成的危害主要是可以访问到管理员权限接口导致用户身份信息和订阅信息泄漏。flag已经在描述中说明要获取test用户的订阅链接，flag格式为hgame{管理员用户订阅链接中的token}。

那么首先注册一个账号，注册后会直接进入用户界面，这时候用户信息就已经在redis缓存中了，这里我们注册了一个`test@abc.com`的普通用户。

![image-20230109203422639](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301092034700.png)

然后以这个authorization请求接口，直接去访问/admin是无法访问的，路由有做权限的配置，这里越权的漏洞需要直接发请求给后端接口。

![image-20230109203558919](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301092035983.png)

只要这个authorization在缓存就行，请求管理员接口不加UA之类的请求头也可以正常越权![image-20230109203714097](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301092037186.png)

根据题目描述要获取到管理员用户订阅连接的token。

因此flag为`hgame{39d580e71705f6abac9a414def74c466}`
