#################################
## 전체 기간 데이터 탐색
#################################
water = read.csv("G:/내 드라이브/22-1 공모전/k-water/Data/water.csv", header = T, encoding = "CP949")

## 날씨 변수 factor화
water$weather = as.factor(water$weather)
summary(water$weather)
# par(family = "AppleGothic")
plot(water$weather)

## 날씨 변수 더미변수화(가변수화)
W_sunny = ifelse(water$weather == "맑음", 1, 0)
W_rainy = ifelse(water$weather == "비", 1, 0)
W_cloud = ifelse(water$weather == "흐림", 1, 0)
water = cbind(water, W_sunny, W_rainy, W_cloud)

## 날짜 변수 Date화
water$wqdt = as.Date(water$wqdt)
class(water$wqdt)
summary(water$wqdt)

## 상관관계 파악 -- 날씨(16번째 열) 범주형으로 하고 다시 할 필요 있음
library(psych)
water_num = water[, -c(16, 17)] ## 문자형변수(날씨, 날짜) 제외
cor(water_num)
cor.plot(water_num)
