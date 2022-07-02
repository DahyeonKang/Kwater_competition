#################################
### 시계열 분석 (1. 시계열 분해)
#################################
## 데이터 불러오기 & 날짜변수 변환
### 1. 연서
Sys.setlocale("LC_ALL", "Korean")
water = read.csv("G:/내 드라이브/22-1 공모전/k-water/Data/water.csv", header = T, encoding = "CP949") 
water$wqdt = as.POSIXct(water$wqdt, format = "%Y-%m-%d")
str(water$wqdt)

### 2. 연서 제외 나머지 지역
new_water = read.csv("G:/내 드라이브/22-1 공모전/k-water/Data/new_water.csv", header = T, encoding = "UTF-8")
new_water$wqdt = as.POSIXct(new_water$wqdt, format = "%Y-%m-%d")
str(new_water$wqdt)

## 지역별 변수 지정
new_water_50001 = new_water[new_water$loccd == 50001, ]  # 횡성
new_water_50002 = new_water[new_water$loccd == 50002, ]  # 둔내
new_water_50003 = new_water[new_water$loccd == 50003, ]  # 우항
new_water_60001 = new_water[new_water$loccd == 60001, ]  # 장항
new_water_87105 = new_water[new_water$loccd == 87105, ]  # 진보
new_water_87201 = new_water[new_water$loccd == 87201, ]  # 약목
new_water_87202 = new_water[new_water$loccd == 87202, ]  # 왜관(기존)
new_water_88001 = new_water[new_water$loccd == 88001, ]  # 동부
new_water_90001 = new_water[new_water$loccd == 90001, ]  # 시화
new_water_90002 = new_water[new_water$loccd == 90002, ]  # 능곡

## 연서 uBac - bBac 기준
## 이상치 처리
water$uBac = ifelse(water$uBac < boxplot(water$uBac)$stats[1,] | water$uBac > boxplot(water$uBac)$stats[5,],
                    median(water$uBac), water$uBac)
water$bBac = ifelse(water$bBac < boxplot(water$bBac)$stats[1,] | water$bBac > boxplot(water$bBac)$stats[5,],
                    median(water$bBac), water$bBac)

## 시계열 분해
### 1. 연서 uBac
water_47000_uBac = ts(water$uBac, frequency = 4, start = c(2019, 01), end = c(2021,06))
fit_47000_uBac = decompose(water_47000_uBac, type = "multiplicative")
plot(fit_47000_uBac)

### 2. 연서 bBac
water_47000_bBac = ts(water$bBac, frequency = 4, start = c(2019, 01), end = c(2021,06))
fit_47000_bBac = decompose(water_47000_bBac, type = "multiplicative")
plot(fit_47000_bBac)