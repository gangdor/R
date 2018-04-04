# ===========================
# 연령대별 월급 차이를 알아보자
# ===========================

library(ggplot2)
library(dplyr)
welfare<-welfare %>% mutate(ageg=ifelse(age<30,'young',ifelse(age<=59,'middle','old')))
table(welfare$ageg)
qplot(welfare$ageg)

# 연령그룹별 평균임금 계산하기
age_income<-welfare%>% filter(!is.na(income))%>%group_by(ageg)%>%summarise(mean_income=mean(income))

# 그래프 그리기, 정렬하기
ggplot(data=age_income, aes(x=ageg,y=mean_income)) + geom_col() + scale_x_discrete(limits=c('old','young','middle'))