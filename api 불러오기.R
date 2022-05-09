##################################
## 공공데이터 API reading
##################################
library(httr)
library(jsonlite)
# ex) 2021년 1월 ~ 6월 : 2021.01.01 ~ 2021.07.01로 설정해야 6월 30일까지 온전히 출력됨
data = GET('http://opendata.kwater.or.kr/openapi-data/service/pubd/sewerage/waterQuality/day/list?serviceKey=GGsw%2BIOUyPbAeasUiCPaom5zocqK4ZEqIIQHUeswsYlOwZyQugsX3cAC1jqRcp4ZNurICccEoINxdefuy2LGEQ%3D%3D&pageNo=1&numOfRows=200&stDt=2021-07-01&edDt=2022-01-01&loccd=47000')
print(data)
data2 = content(data, "text", encoding = "UTF-8")
water = fromJSON(data2)
water
water_2021_2 = water$response$body$items$item  # 상반기 1, 하반기 2
water_2021 = rbind(water_2021_1, water_2021_2) # 상반기 + 하반기 = 1년 데이터프레임
# write.csv(water_2021, "water_2021.csv") 1년 데이터프레임 to csv