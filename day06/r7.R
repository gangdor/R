library(ggplot2)
library(dplyr)
#==============================
# 성별로 어떤 직업이 가장 많을까
#==============================

# 성별 직업 빈도표 만들기
job_male<-welfare %>%
  filter(!is.na(job)&sex=='male') %>% group_by(job) %>% summarise(n=n()) %>% arrange(desc(n)) %>%head(10)

job_female<-welfare%>%filter(!is.na(job)&sex=='female')%>%
  group_by(job)%>%summarise(n=n())%>%arrange(desc(n))%>%head(10)
ggplot(data=job_male, aes(x=reorder(job,n),y=n))+geom_col()+coord_flip()

ggplot(data=job_female, aes(x=reorder(job,n),y=n))+geom_col()+coord_flip()
