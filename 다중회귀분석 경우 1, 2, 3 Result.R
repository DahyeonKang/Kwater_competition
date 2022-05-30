########################################
## 다중회귀분석을 통한 변수 유의성 파악 
########################################
+ 변수 구분
+ b변수 : bBac, bBod, bCod, bSs, bTn, bTp, bVal
+ a : uBac, uBod, uCod, uSs, uTn, uTp, uVal
+ b : a + temper, wtemper, W_sunny, W_rainy, W_cloud

1. y(b변수 각각 7가지) ~ x(a + b)
+ 방출변수를 y로, 방출변수 제외 나머지 변수를 x로
2. y(b변수 각각 7가지) ~ x(a + b + b변수(y에 사용된건 제외))
+ 방출변수를 y로, y에 사용된 변수 제외 나머지 변수를 모두 x로
3. y(b변수 각각 7가지) ~ x(a)
+ 방출변수를 y로, 유입변수만 x로(날씨변수 제외)

# 경우 1
water_bVal = lm(bVal ~ temper + wtemper + W_sunny + W_rainy + W_cloud
                + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bVal)

# 경우 2
water_bVal = lm(bVal ~ ., data = water_num)
summary(water_bVal)

# 경우 3
water_bVal = lm(bVal ~ uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bVal)
