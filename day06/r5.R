# ========================
# 연령대 및 성별 월급 차이
# ========================
library(ggplot2)
library(dplyr)
# 1. 
sex_income<-welfare%>%filter(!is.na(income)) %>% group_by(ageg,sex) %>% summarise(mean_income= mean(income))

# 2. 
ggplot(data=sex_income, aes(x=ageg, y= mean_income, fill=sex))+geom_col()+scale_x_discrete(limits=c('young','middle','old'))

# 3.dodge
ggplot(data=sex_income, aes(x=ageg, y= mean_income, fill=sex))+geom_col(position='dodge')+scale_x_discrete(limits=c('young','middle','old'))

# 4. 성별 연령별 월급 평균표만들기
sex_age<-welfare %>% filter(!is.na(income)) %>% group_by(age,sex) %>% summarise(mean_income=mean(income))

# 선그래프에서는 col로 범주를 나눈다.
ggplot(data=sex_age, aes(x=age, y= mean_income, col=sex))+geom_line()