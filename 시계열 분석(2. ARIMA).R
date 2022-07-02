#################################
### 시계열 분석 (2. ARIMA)
#################################
## 연서 uBac - bBac 기준
## 이상치 처리
water$uBac = ifelse(water$uBac < boxplot(water$uBac)$stats[1,] | water$uBac > boxplot(water$uBac)$stats[5,],
                    median(water$uBac), water$uBac)
water$bBac = ifelse(water$bBac < boxplot(water$bBac)$stats[1,] | water$bBac > boxplot(water$bBac)$stats[5,],
                    median(water$bBac), water$bBac)

## ARIMA forecasting
### 1. 연서 uBac
library(forecast)
auto.arima(water_47000_uBac)  # ARIMA(0, 1, 0)
water_47000_uBac.arima = arima(water_47000_uBac, order = c(0, 1, 0))
water_47000_uBac.forecast = forecast(water_47000_uBac.arima, h = 4)
plot(water_47000_uBac.forecast)

## 2. 연서 bBac
auto.arima(water_47000_bBac)  # ARIMA(1, 1, 0)
water_47000_bBac.arima = arima(water_47000_bBac, order = c(1, 1, 0))
water_47000_bBac.forecast = forecast(water_47000_bBac.arima, h = 4)
plot(water_47000_bBac.forecast)
