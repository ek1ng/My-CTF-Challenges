# Guess Who I Am
获取头像和昵称对应关系的方法
通过信息搜集发现https://github.com/Potat0000/Vidar-Website/blob/master/src/scripts/config/member.js或者https://vidar.club/assets/js/index.33923334.chunk.js中unicode编码后的成员信息，可以得到头像和成员简介的对应关系（Json格式），再编写一个Python脚本，通过requests库请求页面信息，并且用bs库来解析intro得到内容，从json中找到对应的id请求/api/verifyAnswer接口来通过验证，正确回答100次即可得到Flag。