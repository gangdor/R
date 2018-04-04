# ====================
# 직업별 월급 차이 
# ====================
library(ggplot2)
library(dplyr)
library(readxl)
class(welfare$code_job)

# 직업코드 읽어오기
list_job<-read_excel('Koweps_Codebook.xlsx', col_names = T, sheet = 2)
head(list_job)
dim(list_job)

# 직업코드 leftjoin하기
welfare<-left_join(welfare, list_job, id='code_job')

welfare %>% filter(!is.na(code_job)) %>% select(code_job, job) %>% head(10)

# 직업별 월급 차이 분석하자
# 1. 직업별 월급 평균표 만들기
job_income <- welfare %>% filter(!is.na(job) & !is.na(income)) %>% group_by(job) %>% summarise(mean_income=mean(income))

head(job_income)

# 월급 내림차순
top10<-job_income%>%arrange(desc(mean_income)) %>% head(10)

# 상위 그래프 만들기
ggplot(data=top10, aes(x=reorder(job,mean_income), y=mean_income))+geom_col()+ coord_flip()

# 하위 그래프 만들기
bottom10<-job_income%>%arrange(mean_income)%>%head(10)
ggplot(data=bottom10, aes(x=reorder(job,-mean_income), y=mean_income))+geom_col()+coord_flip()+ylim(0,850)

