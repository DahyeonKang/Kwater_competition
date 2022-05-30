#################################
## 중요 변수 선택
#################################
## 방법 1. PCA(주성분분석)를 통한 차원 축소
par(mfrow = c(1, 1))
## PCA(all variable)
water_2019.pca = prcomp(water_2019_num, center = TRUE, scale = TRUE)
print(water_2019.pca)
plot(water_2019.pca, type = "l")
summary(water_2019.pca)
biplot(water_2019.pca)

## PCA2(유입량에 대한 변수에 대해서만)
water_2019_u = subset(water_2019_num, select = c("uBac", "uBod", "uCod", "uSs", "uTn", 
                                                 "uTp", "uVal", "temper", "wtemper", "W_sunny", "W_rainy"))
head(water_2019_u)
water_2019_u.pca = prcomp(water_2019_u, center = TRUE, scale = TRUE)
print(water_2019_u.pca)
plot(water_2019_u.pca, type = "l")
summary(water_2019_u.pca)
biplot(water_2019_u.pca)

## PCA3(유출량에 대한 변수에 대해서만)
water_2019_b = subset(water_2019_num, select = c("bBac", "bBod", "bCod", "bSs", "bTn", 
                                                 "bTp", "bVal", "temper", "wtemper", "W_sunny", "W_rainy"))
head(water_2019_b)
water_2019_b.pca = prcomp(water_2019_b, center = TRUE, scale = TRUE)
print(water_2019_b.pca)
plot(water_2019_b.pca, type = "l")
summary(water_2019_b.pca)
biplot(water_2019_b.pca)
## 3가지 pca를 다 해보았을 때 모든 변수가 자료 설명에 필요하다고 판단되어
## 다중회귀를 통해 유의변수를 가려보도록 하겠다.

# 방출수에 대한 다중회귀
water_2019_bCod = lm(bCod ~ ., data = water_2019_num)
summary(water_2019_bCod)  
## 모든 변수를 y로 두고 다중회귀를 해보았을 때 bCod를 종속변수로 
## 하는 것이 변수 유의성이 높게 나왔고 결정계수도 높게 나와
## 방출수에 대한 예측 모형을 만들 때에는 y를 bCod로 두고 모형 적합하면 될 듯

water_2019_bCod_bb = lm(bCod ~ bBac + bBod + bSs + bTn + bTp + bVal 
                        + temper + wtemper + W_sunny + W_rainy, data = water_2019_num)
summary(water_2019_bCod_bb)
par(mfrow = c(2, 2))
plot(water_2019_bCod_bb)

# 유입수에 대한 다중회귀
water_2019_uCod = lm(uCod ~ ., data = water_2019_num)
summary(water_2019_uCod)
## 방출수에서 Cod를 예측변수로 두었다는 점을 참고하여 유입수에 대해서도
## Cod에 대한 다중회귀를 해보니 결정계수도 높고 다른 변수를 y에 둔 것과
## 비교하였을 때 높은 변수유의성을 띠므로 uCod를 예측변수로 두고 하면 될 듯

water_2019_uCod_uu = lm(uCod ~ uBac + uBod + uSs + uTn + uTp + uVal 
                        + temper + wtemper + W_sunny + W_rainy, data = water_2019_num)
summary(water_2019_uCod_uu) 
