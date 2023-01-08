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
url = "http://week-1.hgame.lwsec.cn:31746"
cookies['session'] = 'MTY3Mjg4Nzk4MnxEdi1CQkFFQ180SUFBUkFCRUFBQU9fLUNBQUlHYzNSeWFXNW5EQWdBQm5OdmJIWmxaQU5wYm5RRUFnQUFCbk4wY21sdVp3d05BQXRqYUdGc2JHVnVaMlZKWkFOcGJuUUVBZ0JxfAue3fcPP_M2DO-5E6e17rIWaosJfl2FkmAFevW687rc'

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