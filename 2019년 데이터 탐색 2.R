#################################
## 2019년 데이터 탐색 2
#################################
## 날씨 변수 factor화
water_2019$weather = as.factor(water_2019$weather)
str(water_2019)
summary(water_2019$weather)
par(family = "AppleGothic")
plot(water_2019$weather)

## 날씨 변수 더미변수화(가변수화)
W_sunny = ifelse(water_2019$weather == "맑음", 1, 0)
W_rainy = ifelse(water_2019$weather == "비", 1, 0)
water_2019 = cbind(water_2019, W_sunny, W_rainy)

## 시계열성 관리
water_2019$wqdt = as.Date(water_2019$wqdt)
class(water_2019$wqdt)
summary(water_2019$wqdt)

## 상관관계 파악
library(psych)
water_2019_num = water_2019[, -c(16, 17)] ## 문자형변수(날씨, 날짜) 제외
cor(water_2019_num)
cor.plot(water_2019_num)
