# 결측치, 이상치 정제하기
st <- read.csv('csv_exam.csv', header=F)
View(st)
colnames(st) <- c('id','class','ko','en','ma')
# 결측치 확인 함수 is.na
table(is.na(st$class))
mean(st$ko,na.rm = T)
# 학생 정보를 조회하시오
# 단 id, class, ko 결측치가 있는 학생은 빼시오
library(dplyr)
st %>% filter(!is.na(id) & !is.na(class) & !is.na(ko))
st[!is.na(st$ko),c('id','class','ko')]
# 모든 결측치 제거하기
st2<-na.omit(st)
# 국영수 평균을 구하여 vector를 만든다.
avg <- round(colMeans(st2[,c('ko','en','ma')]),2)
class(avg)

# 결측치 대체하기
st$ko <- ifelse(is.na(st$ko),0,st$ko)
table(is.na(st$ko))
st[is.na(st)]=1
boxplot(st$ko)
hist(st$ko)
qplot(st$ko)

