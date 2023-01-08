## Classic Childhood Game Writeup

游戏代码来自https://github.com/Vinlic/h5-mota

F12打开浏览器的开发者工具，由于游戏是纯前端制作的，因此所有的游戏数据都会存储在客户端，在**/Res/event.js中函数mota()是一段混淆过的js，这是我额外添加上去的，内容是在游戏通关任意一个结局后输出Flag**,那么首先正常通关游戏当然是可以完成挑战的，下面是一些可以用技术通关游戏的方法

![image-20230105112212815](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051122936.png)

办法0：正常玩把游戏任意一个结局打通也可以获得辛苦分,不过还是希望能够学习一下别的做法哦！

办法1：在浏览器界面F12,在控制台中直接运行mota();

办法2：用F12打断点，让在一开始与仙子对话时的Switch语句的ID值为任何一个能通关的分支，就可以直接拿到flag。

办法3：存档功能通过浏览器的localstorage实现，修改其中数据使自己战斗力++然后把游戏打通关，一路薄纱上去不用多久。

办法4：通过你强大的调试技术(XD，来调试这段混淆后的js代码，看出来这段混淆后的js代码逻辑。

![image-20230105112450814](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301051124854.png)

混淆一下这段代码是为了不让直接搜索`hgame{`等字样就可以搜到处理结局后输出flag的这个`mota()`函数，混淆是用https://www.json.cn/json/jshx.html 开方法变量重命名 字符串加密 重排字符串 Base64编码字符串 Unicode转义生成的混淆代码。