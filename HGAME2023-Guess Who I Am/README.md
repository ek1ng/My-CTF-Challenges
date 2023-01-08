 ## Guess Who I Am

根据题目描述和提示可以看出，站点会给出协会成员的介绍，需要输入正确的成员ID 100次，那么本身设定100次是确实会导致你可以硬做做出来的，但是还是希望大家能够学会用Python来写一个脚本。

首先我们肯定要考虑的是我们怎么样获取ID和成员介绍对应的关系，在F12中看到的member.js文件中直接把export default删掉改成json文件的话，用python的json.load函数读取会报错，因为require这个属性是本来在js文件里面找到对应图片用的，那我们这里反正也不需要头像，就把头像和博客链接都删掉好了。这里的话就涉及怎么对一些文本做批量的编辑，那比较快捷的办法的话比如说用像Vsode之类的编辑器来做批量的编辑。可以ctrl + f选中所有需要编辑的信息后，右键更改所有匹配项，让每一个`"avatar"`前面都出现光标，再用shift + 方向键，就可以用多个光标批量选中删除啦。

![image-20230105125530701](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423787.png)

![image-20230105125955836](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423605.png)

![image-20230105131431258](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423956.png)

处理完后我们就可以继续写脚本的工作啦，我们要做的内容就是读入json文件并且解析内容，请求获取成员介绍，通过json里读进来的内容匹配出对应的ID,用这个ID去请求验证答案的接口，当得分超过100时去关注返回的页面看看有没有什么不一样的信息。

读入json文件并且解析内容

```python
import json
with open('member.json') as f:
    member = json.load(f)
print(member)
```



![image-20230105131912549](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423259.png)

接下来F12看一下网站的后端接口设计，请求对应的后端接口拿到成员介绍。

![image-20230105132253514](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423652.png)

这里可能就会考虑一个问题，网站是怎么对于不同用户的信息进行判断的呢，这里也没有什么登陆啊，我能不能直接让服务端认为我已经拿到了100分呢？站点通过Cookie中的session来记录了用户信息，而session是通过Key来加密的，所以不知道Key的用户是没有办法做到在客户端修改分数的。

那么我们这里要带着session去请求`/api/getQuestion`的接口来获取问题。

```python
cookies = {}
cookies['session'] = 'MTY3Mjg4Nzk4MnxEdi1CQkFFQ180SUFBUkFCRUFBQU9fLUNBQUlHYzNSeWFXNW5EQWdBQm5OdmJIWmxaQU5wYm5RRUFnQUFCbk4wY21sdVp3d05BQXRqYUdGc2JHVnVaMlZKWkFOcGJuUUVBZ0JxfAue3fcPP_M2DO-5E6e17rIWaosJfl2FkmAFevW687rc'
res = requests.get("http://week-1.hgame.lwsec.cn:31746/api/getQuestion",cookies=cookies)
print(res.text)
```

![image-20230105133805715](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423139.png)

这里我们获得了一个json格式的数据，我们的目标是去提取我们想要的成员介绍的内容，但是请求得到的数据类型是str,所以需要转换成Dict。

```python
cookies = {}
cookies['session'] = 'MTY3Mjg4Nzk4MnxEdi1CQkFFQ180SUFBUkFCRUFBQU9fLUNBQUlHYzNSeWFXNW5EQWdBQm5OdmJIWmxaQU5wYm5RRUFnQUFCbk4wY21sdVp3d05BQXRqYUdGc2JHVnVaMlZKWkFOcGJuUUVBZ0JxfAue3fcPP_M2DO-5E6e17rIWaosJfl2FkmAFevW687rc'
res = requests.get("http://week-1.hgame.lwsec.cn:31746/api/getQuestion",cookies=cookies)
print(res.text)
rs = json.loads(res.text)
print(rs['message'])
```

获取到对应的成员介绍后我们就在成员信息中匹配到对应的ID

```python
# 匹配对应的ID
answer = ''
for i in member:
    if i['intro'] == rs['message']:
        answer = i['id']
        break
print(answer)
```

![image-20230105135706428](/home/ek1ng/.config/Typora/typora-user-images/image-20230105135706428.png)

匹配到ID后我们就发请求验证一下答案

![image-20230105135949589](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423735.png)

可以看到是以POST请求发送给了`/api/verifyAnswer`接口

由于后端用的是Golang,框架是Gin,是客户端session,也就是说包括分数包括问题都是存储在session中，那么我们每次答对题目分数和问题都是会改变的，在页面上我们答对问题会有`set-cookie`的响应头来重新设置新的session,但是我们编写脚本就得自己来处理这个问题，需要从set-cookie中拿到新的session然后再开始新一轮的自动答题。

![image-20230105140546791](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051423321.png)

```python
data = {'id':answer}
res = requests.post("http://week-1.hgame.lwsec.cn:31746/api/verifyAnswer",cookies=cookies,data=data)
print("[*] Result: "+ res.text)
cookies['session'] = res.cookies['session']
```

再补上对于分数接口的请求，外层加上一个While循环，判断分数到达100时退出，因为后端接口总共也就只有获取问题，获取分数，验证答案三个，那么我们可以判断分数到达100时肯定是从这三个接口会能够返回和Flag相关的信息。

完整的EXP脚本如下：

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import requests
# 读取json文件并且解析
with open('member.json') as f:
    member = json.load(f)

cookies = {}
answer = ''
score = 0
url = "你的靶机地址"
cookies['session'] = '从F12中复制session的值'

while score < 100:
    # 请求getQuestion接口
    res = requests.get(url + "/api/getQuestion", cookies=cookies)
    rs = json.loads(res.text)
    print("[+] getQuestion: " + res.text)

    # 匹配对应的ID
    for i in member:
        if i['intro'] == rs['message']:
            answer = i['id']
            break

    # 请求verifyAnswer接口
    data = {'id': answer}
    res = requests.post(url + "/api/verifyAnswer", cookies=cookies, data=data)
    rs = json.loads(res.text)
    print("[*] Result: " + rs['message'])
    cookies['session'] = res.cookies['session']

    # 请求getScore接口
    res = requests.get(url + "/api/getScore", cookies=cookies)
    rs = json.loads(res.text)
    score = rs['message']
    print("[*] Score: " + str(rs['message']))
```

发现在请求100次后Score的返回就是Flag了，`hgame{Guess_who_i_am^Happy_Crawler}`

![image-20230105141709925](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051424873.png)
