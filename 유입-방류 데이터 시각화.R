#############################
### 유입-방류 데이터 시각화
#############################
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
### 1. 연서 uBac
par(oma = c(0, 0, 0, 0))
par(mfrow = c(1, 1))
plot(water$wqdt, water$uBac, main = "2019-2021 uBac")
water$uBac = ifelse(water$uBac < boxplot(water$uBac)$stats[1,] | water$uBac > boxplot(water$uBac)$stats[5,],
                    median(water$uBac), water$uBac)
summary(water$uBac)
plot(water$wqdt, water$uBac, main = "2019-2021 uBac")

### 2. 연서 bBac
plot(water$wqdt, water$bBac, main = "2019-2021 bBac")
water$bBac = ifelse(water$bBac < boxplot(water$bBac)$stats[1,] | water$bBac > boxplot(water$bBac)$stats[5,],
                    median(water$bBac), water$bBac)
summary(water$bBac)
plot(water$wqdt, water$bBac, main = "2019-2021 bBac")

### 3. 연서 uBac - bBac
par(oma = c(0, 0, 0, 2))
plot(water$wqdt, water$uBac, xlab = "Date", ylab = "uBac", type = "l", lwd = 1,
     col = "pink", main = "2019-2021 연서(47000) Bac", axes = FALSE)
axis.POSIXct(1, water$wqdt, format = "%Y-%m"); axis(2)
par(new = TRUE)
plot(water$wqdt, water$bBac, xlab = "", ylab = "", type = "l", col = "skyblue", lwd = 1, axes = FALSE)
mtext("bBac",side = 4, line = 3)  # right y label
axis(4)
box()
legend("topleft", legend = c("uBac", "bBac"), col = c("pink", "skyblue"), lty = 1, bty = "n")
abline(v = as.POSIXct(c("2020-01-09", "2021-03-14")), col = "blue", lwd = 3, lty = 2)
