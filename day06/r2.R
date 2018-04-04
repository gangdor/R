library(ggplot2)
library(dplyr)
welfare$income
table(is.na(welfare$income))
summary(welfare$income)
qplot(welfare$income) + xlim(0,1000)
summary(welfare$income)
#이상치 결측 처리
welfare$income<-ifelse(welfare$income %in% c(0,0000),NA,welfare$income)

table(is.na(welfare$income))
summary(welfare$income)
sex_income<- welfare %>% filter(!is.na(income)) %>% group_by(sex) %>% summarise(mean_income=mean(income))

class(sex_income)
ggplot(data=sex_income, aes(x=sex, y=mean_income))+geom_col()