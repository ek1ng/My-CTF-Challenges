

根据题目名字可以知道，是考察Git 泄漏，访问/.git也能够发现存在.git![image-20230116170705594](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301161707683.png)

这里可以用一些现成的git泄漏利用工具，比如说githack等等，也可以手动进行恢复

![image-20230116170954377](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301161709422.png)

从.git目录的`COMMIT_EDITMSG`会发现最新的commit里面添加了flag文件

这里以githack为例，dump泄漏文件内容，flag就在里面。

![image-20230116171134800](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301161711847.png)

![image-20230116171202186](https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301161712214.png)