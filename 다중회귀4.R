#새로운 변수 만들기(제거율)
Bac <- (water$uBac-water$bBac)/water$uBac
Bod <- (water$uBod-water$bBod)/water$uBod
Cod <- (water$uCod-water$bCod)/water$uCod
Ss <- (water$uSs-water$bSs)/water$uSs
Tn <- (water$uTn-water$bTn)/water$uTn
Tp <- (water$uTp-water$bTp)/water$uTp
Val <- (water$uVal-water$bVal)/water$uVal

#새로운 데이터프레임 만들기
water_new <- data.frame(Bac,Bod,Cod,Ss,Tn,Tp,Val,water$temper,water$wtemper,water$W_sunny,water$W_rainy,water$W_cloud)

#유압-방출 차이에 대한 회귀분석
water_Bac = lm(Bac ~ Bod + Cod + Ss + Tn + Tp + Val + water.temper + water.wtemper + water.W_sunny + water.W_rainy + water.W_cloud, data = water_new)
water_Bod = lm(Bod ~ Bac + Cod + Ss + Tn + Tp + Val + water.temper + water.wtemper + water.W_sunny + water.W_rainy + water.W_cloud, data = water_new)
water_Cod = lm(Cod ~ Bac + Bod + Ss + Tn + Tp + Val + water.temper + water.wtemper + water.W_sunny + water.W_rainy + water.W_cloud, data = water_new)
water_Ss = lm(Ss ~ Bac + Bod + Cod + Tn + Tp + Val + water.temper + water.wtemper + water.W_sunny + water.W_rainy + water.W_cloud, data = water_new)
water_Tn = lm(Tn ~ Bac + Bod + Cod + Ss + Tp + Val + water.temper + water.wtemper + water.W_sunny + water.W_rainy + water.W_cloud, data = water_new)
water_Tp = lm(Tp ~ Bac + Bod + Cod + Ss + Tn + Val + water.temper + water.wtemper + water.W_sunny + water.W_rainy + water.W_cloud, data = water_new)
water_Val = lm(Val ~ Bac + Bod + Cod + Ss + Tn + Tp+ water.temper + water.wtemper + water.W_sunny + water.W_rainy + water.W_cloud, data = water_new)
summary(water_Bac)
summary(water_Bod)
summary(water_Cod)
summary(water_Ss)
summary(water_Tn)
summary(water_Tp)
summary(water_Val)