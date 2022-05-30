#################################
## 다중회귀_CASE 1
#################################
water_bBac = lm(bBac ~ temper + wtemper + W_sunny + W_rainy + W_cloud
                + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bBac)  

water_bBod = lm(bBod ~ temper + wtemper + W_sunny + W_rainy + W_cloud
                + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bBod)

water_bCod = lm(bCod ~ temper + wtemper + W_sunny + W_rainy + W_cloud
                + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bCod)

water_bSs = lm(bSs ~ temper + wtemper + W_sunny + W_rainy + W_cloud
               + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bSs)

water_bTn = lm(bTn ~ temper + wtemper + W_sunny + W_rainy + W_cloud
               + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bTn)

water_bTp = lm(bTp ~ temper + wtemper + W_sunny + W_rainy + W_cloud
               + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bTp)

water_bVal = lm(bVal ~ temper + wtemper + W_sunny + W_rainy + W_cloud
                + uBac + uBod + uCod + uSs + uTn + uTp + uVal, data = water_num)
summary(water_bVal)

> bVal을 y변수로 선택하는것이 제일 바람직(결정계수 0.9773)