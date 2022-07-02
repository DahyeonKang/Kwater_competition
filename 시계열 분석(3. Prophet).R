#################################
### 시계열 분석 (3. Prophet)
#################################
## 연서 uBac - bBac 기준
## 이상치 처리
water$uBac = ifelse(water$uBac < boxplot(water$uBac)$stats[1,] | water$uBac > boxplot(water$uBac)$stats[5,],
                    median(water$uBac), water$uBac)
water$bBac = ifelse(water$bBac < boxplot(water$bBac)$stats[1,] | water$bBac > boxplot(water$bBac)$stats[5,],
                    median(water$bBac), water$bBac)

## Prophet
### 1. 연서 uBac
library(prophet)
df_47000_uBac = data.frame(ds = water$wqdt, y = water$uBac, daily.seasonality = TRUE)
model_47000_uBac = prophet(df_47000_uBac, daily.seasonality = TRUE)
future_47000_uBac = make_future_dataframe(model_47000_uBac, periods = 180)
forecast_47000_uBac = predict(model_47000_uBac, future_47000_uBac)
head(forecast_47000_uBac[c("ds", "yhat", "yhat_lower", "yhat_upper")], 5)
tail(forecast_47000_uBac[c("ds", "yhat", "yhat_lower", "yhat_upper")], 5)
plot(model_47000_uBac, forecast_47000_uBac)

df_47000_uBac.cv = cross_validation(model_47000_uBac, initial = 360, period = 90, horizon = 180, units = "days")
df_47000_uBac.p = performance_metrics(df_47000_uBac.cv)
head(df_47000_uBac.p, 3)
tail(df_47000_uBac.p, 3)
plot_cross_validation_metric(df_47000_uBac.cv, metric = "mse")
plot_cross_validation_metric(df_47000_uBac.cv, metric = "rmse")
plot_cross_validation_metric(df_47000_uBac.cv, metric = "mae")
plot_cross_validation_metric(df_47000_uBac.cv, metric = "mape")

### 2. 연서 bBac
df_47000_bBac = data.frame(ds = water$wqdt, y = water$bBac, daily.seasonality = TRUE)
model_47000_bBac = prophet(df_47000_bBac, daily.seasonality = TRUE)
future_47000_bBac = make_future_dataframe(model_47000_bBac, periods = 180)
forecast_47000_bBac = predict(model_47000_bBac, future_47000_bBac)
head(forecast_47000_bBac[c("ds", "yhat", "yhat_lower", "yhat_upper")], 5)
tail(forecast_47000_bBac[c("ds", "yhat", "yhat_lower", "yhat_upper")], 5)
plot(model_47000_bBac, forecast_47000_bBac)

df_47000_bBac.cv = cross_validation(model_47000_bBac, initial = 360, period = 90, horizon = 180, units = "days")
df_47000_bBac.p = performance_metrics(df_47000_bBac.cv)
head(df_47000_bBac.p, 3)
tail(df_47000_bBac.p, 3)
plot_cross_validation_metric(df_47000_bBac.cv, metric = "mse")
plot_cross_validation_metric(df_47000_bBac.cv, metric = "rmse")
plot_cross_validation_metric(df_47000_bBac.cv, metric = "mae")
plot_cross_validation_metric(df_47000_bBac.cv, metric = "mape")