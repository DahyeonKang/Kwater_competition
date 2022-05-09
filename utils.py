## API 가져오는 코드

from urllib.request import urlopen
import pandas as pd
import numpy as np
import xmltodict
import os
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from urllib.request import urlopen
from urllib.parse import urlencode, unquote, quote_plus
import urllib
import json
from datetime import date, timedelta
import re

## 다현
# 하수도 일일 수질
url = "http://opendata.kwater.or.kr/openapi-data/service/pubd/sewerage/waterQuality/day/list?"

params = '?' + urlencode({
        quote_plus('serviceKey'): "yR%2Bloy28kXA0ULzW1u08U8dH3xFQJQkn8hPdCLm0fk00uHrBQS9HVMc%2BjeI9wGglQS0pDLmj%2BI4scJbb0nCxoQ%3D%3D",
        quote_plus('numOfRows'): "500",
        quote_plus('pageNo'): "1",
        quote_plus('stDt'): "2019-01-01",
        quote_plus('edDt'): "2022-04-30",
        quote_plus('loccd'): "47000"
})
req = urllib.request.Request(url + unquote(params))
response_body = urlopen(req).read()  # get bytes data
decode_data = response_body.decode('utf-8')

xml_parse = xmltodict.parse(decode_data)  # string인 xml 파싱
xml_dict = json.loads(json.dumps(xml_parse))

tmp = list(xml_dict['response']['body']['items'].values())
print(tmp)
print(type(tmp))

n = ['bBac', 'bBod', 'bCod', 'bSs', 'bTn', 'bTp', 'bVal', 'loccd', 'locnm', 'temper', 'uBac', 'uBod', 'uCod', 'uSs', 'uTn', 'uTp', 'uVal', 'weather', 'wqdt', 'wtemper']
n_cols = ['방류수대장균수', '방류수']

## 희은
# 하수도 일일 수질
# import requests, xmltodict, json
#
# key = "4WXIeE3OgUhGN4I9RRuqw1B8SqCyJDhqDS3zjkJ2187s%2FxBnkAC6P%2BBCeQfrtrUaPrWLwdRI2WFijdY3zZu9Gw%3D%3D"
#
# url = "http://opendata.kwater.or.kr/openapi-data/service/pubd/sewerage/waterQuality/day/list?stDt=2019-09-01&edDt=2019-10-30&loccd=47000&numOfRows=10&pageNo=1&ServiceKey={}".format(key)
#
#
# content = requests.get(url).content
# dict = xmltodict.parse(content)
# jsonString = json.dumps(dict['response']['body']['items']['item'], ensure_ascii=False)
# json0bj = json.loads(jsonString)
# print(json0bj)


# 하수도 처리시설
# import requests, xmltodict, json
#
# key = "4WXIeE3OgUhGN4I9RRuqw1B8SqCyJDhqDS3zjkJ2187s%2FxBnkAC6P%2BBCeQfrtrUaPrWLwdRI2WFijdY3zZu9Gw%3D%3D"
# url = "http://opendata.kwater.or.kr/openapi-data/service/pubd/sewerage/waterQuality/fcltylist/codelist? numOfRows=50&pageNo=1&ServiceKey={}".format(key)
#
# content = requests.get(url).content
# dict = xmltodict.parse(content)
# jsonString = json.dumps(dict['response']['body']['items'], ensure_ascii=False)
# json0bj = json.loads(jsonString)
# print(json0bj[])


## 전력데이터 공모전 코드
# params = '?' + urlencode({
#             quote_plus("serviceKey"): "pZJEMH0Cz6YgvpYEA9aBKUjQzMRd98fQhpKGmedyKXXGp2frcaqDYKtlxjqCaINZERNTDZTkzZJwLh9k0fDUoA%3D%3D",
#             quote_plus("numOfRows"): "36",
#             quote_plus("pageNo"): "1",
#             quote_plus("dataType"): "xml",
#             quote_plus("dataCd"): "ASOS",
#             quote_plus("dateCd"): "HR",
#             quote_plus("startDt"): start_date,
#             quote_plus("startHh"): "12",
#             quote_plus("endDt"): end_date,
#             quote_plus("endHh"): "23",
#             quote_plus("stnIds"): "{}".format(input_area),  # 참고: 지점명-부산 / 관리관서-부산지방기상청
#         })
#         print('inputarea : ', input_area)
#         req = urllib.request.Request(url + unquote(params))
#         response_body = urlopen(req, timeout=60).read()  # get bytes data
#         decode_data = response_body.decode('utf-8')
#
#         xml_parse = xmltodict.parse(decode_data)  # string인 xml 파싱
#         xml_dict = json.loads(json.dumps(xml_parse))
#
#         self.tmp = list(xml_dict['response']['body']['items'].values())
