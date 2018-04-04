library(ggplot2)
library(dplyr)
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)
# ===========================
# 나이별 월급 그래프를 그려보자
# ===========================

# 1. 이상치 결측 처리하기
welfare$birth<-ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))

# 2. 나이변수 만들기
welfare$age<- 2015 - welfare$birth +1
summary(welfare$age)

# 3. 나이에 따른 월급 평균표 만들기
age_income <- welfare %>% filter(!is.na(income)) %>% group_by(age) %>% summarise(mean_income=mean(income))

# 4. 그래프그리기
ggplot(data=age_income, aes(x=age,y=mean_income))+geom_line()

