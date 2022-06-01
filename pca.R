Sys.setlocale("LC_ALL", "Korean")
water = read.csv("C:/Users/kl122/Desktop/충북대/2. Activity/대회/2022 대국민 물 빅데이터 공모전/nogitcode/preprocessing/water.csv", header = T, encoding = "CP949")
head(water)

## 데이터 타입 변경
library(readr)
water$bVal = parse_number(water$bVal)
water$uBac = parse_number(water$uBac)
water$uBod = parse_number(water$uBod)
water$uVal = parse_number(water$uVal)
str(water)


## PCA(all variable)
water.pca = prcomp(water[, -c(16:17)], center = TRUE, scale = TRUE)
water.landtype = water[, 27]
print(water.pca)
plot(water.pca, type = "l")
summary(water.pca)
par(mfrow = c(1, 1))
biplot(water.pca, xlim = c(-3e-04, 5e-04), ylim = c(-3e-04, 5e-04))

## PCA2(chosed variable)
## yyyymmdd, hhnn, lon, stn, uv, solorza, esr, height
uv2001_repca = subset(water, select = c("yyyymmdd", "hhnn", "stn", "lon", "uv", 
                                         "solorza", "esr", "height"))
head(water_repca)
uv2001_repca.pca = prcomp(water_repca, center = TRUE, scale = TRUE)
print(water_repca.pca)
plot(water_repca.pca, type = "l")
summary(water_repca.pca)
biplot(water_repca.pca)
