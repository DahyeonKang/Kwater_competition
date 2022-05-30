water = read.csv("C:/Users/home/Desktop/김지희/4학년 1학기/수자원공사 물공모전/water_data/water.csv", header = T, encoding = "CP949")

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

# 날씨 변수 가변수화한 것 회귀모형
## 날씨 간 차이 있는지 확인
library(MASS)
### 방류 박테리아 수 날씨별 차이
model1 <- aov(water$bBac ~ water$weather)
summary(model1)
t1 = TukeyHSD(model1, "water$weather")
t1
plot(t1, las="2")

### 방류 bod 날씨별 차이
model2 <- aov(water$bBod ~ water$weather)
summary(model2)
t2 = TukeyHSD(model2, "water$weather")
t2
plot(t2, las="2")

### 방류 cod 날씨별 차이
model3 <- aov(water$bCod ~ water$weather)
summary(model3)
t3 = TukeyHSD(model3, "water$weather")
t3
plot(t3, las="2")

### 방류 Ss 날씨별 차이
model4 <- aov(water$bSs ~ water$weather)
summary(model4)
t4 = TukeyHSD(model4, "water$weather")
t4
plot(t4, las="2")

### 방류 Tn 날씨별 차이
model5 <- aov(water$bTn ~ water$weather)
summary(model5)
t5 = TukeyHSD(model5, "water$weather")
t5
plot(t5, las="2")

### 방류 Tp 날씨별 차이
model6 <- aov(water$bTp ~ water$weather)
summary(model6)
t6 = TukeyHSD(model6, "water$weather")
t6
plot(t6, las="2")

### 방류 Val 날씨별 차이
model7 <- aov(water$bVal ~ water$weather)
summary(model7)
t7 = TukeyHSD(model7, "water$weather")
t7
plot(t7, las="2")

### 유입 박테리아 수 날씨별 차이
umodel1 <- aov(water$uBac ~ water$weather)
summary(umodel1)
ut1 = TukeyHSD(umodel1, "water$weather")
ut1
plot(ut1, las="2")

### 유입 bod 날씨별 차이
umodel2 <- aov(water$uBod ~ water$weather)
summary(umodel2)
ut2 = TukeyHSD(umodel2, "water$weather")
ut2
plot(ut2, las="2")

### 유입 cod 날씨별 차이
umodel3 <- aov(water$uCod ~ water$weather)
summary(umodel3)
ut3 = TukeyHSD(umodel3, "water$weather")
ut3
plot(ut3, las="2")

### 유입 Ss 날씨별 차이
umodel4 <- aov(water$uSs ~ water$weather)
summary(umodel4)
ut4 = TukeyHSD(umodel4, "water$weather")
ut4
plot(ut4, las="2")

### 유입 Tn 날씨별 차이
umodel5 <- aov(water$uTn ~ water$weather)
summary(umodel5)
ut5 = TukeyHSD(umodel5, "water$weather")
ut5
plot(ut5, las="2")

### 유입 Tp 날씨별 차이
umodel6 <- aov(water$uTp ~ water$weather)
summary(umodel6)
ut6 = TukeyHSD(umodel6, "water$weather")
ut6
plot(ut6, las="2")

### 유입  Val 날씨별 차이
umodel7 <- aov(water$uVal ~ water$weather)
summary(umodel7)
ut7 = TukeyHSD(umodel7, "water$weather")
ut7
plot(ut7, las="2")