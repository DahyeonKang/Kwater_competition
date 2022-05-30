#################################
## 2019년 데이터 탐색
#################################
setwd("C:/Users/X-Note/Desktop")
water_2019 = read.csv("water_2019.csv", encoding = "CP949")
str(water_2019)

## 불필요한 열 삭제
water_2019 = water_2019[-c(1, 9, 10)]  # X, loccd, locnm 삭제
str(water_2019)  

## 데이터 형태 변경(str -> num)
library(readr)
water_2019$bVal = parse_number(water_2019$bVal)
water_2019$uBac = parse_number(water_2019$uBac)
water_2019$uBod = parse_number(water_2019$uBod)
water_2019$uVal = parse_number(water_2019$uVal)
str(water_2019)

## 변수별 히스토그램
par(mfrow = c(3, 3))
hist(water_2019$bBac, xlin = c(0, 200), breaks = 1000)
hist(water_2019$bBod, xlin = c(0, 200), breaks = 1000)
hist(water_2019$bCod, xlin = c(0, 200), breaks = 1000)
hist(water_2019$bSs, xlin = c(0, 200), breaks = 1000)
hist(water_2019$bTn, xlin = c(0, 200), breaks = 1000)
hist(water_2019$bTp, xlin = c(0, 200), breaks = 1000)
hist(water_2019$bVal, xlin = c(0, 200), breaks = 1000)
hist(water_2019$temper, xlin = c(0, 200), breaks = 1000)
hist(water_2019$uBac, xlin = c(0, 200), breaks = 1000)
hist(water_2019$uBod, xlin = c(0, 200), breaks = 1000)
hist(water_2019$uCod, xlin = c(0, 200), breaks = 1000)
hist(water_2019$uSs, xlin = c(0, 200), breaks = 1000)
hist(water_2019$uTn, xlin = c(0, 200), breaks = 1000)
hist(water_2019$uTp, xlin = c(0, 200), breaks = 1000)
hist(water_2019$uVal, xlin = c(0, 200), breaks = 1000)
hist(water_2019$wtemper, xlin = c(0, 200), breaks = 1000)
