library('ggplot2')
mpg
# show the table
View(mpg)
# 행, 열 갯수 보기
dim(mpg)
# 데이터속성확인
str(mpg)
# 요약통계 보기
summary(mpg)

tf<-data.frame(x=c(1:5),y=c(6:10))
tfc<-tf
colnames(tfc)<-c('col1','col2')

library('dplyr')
#일부 변수명 변경
tfc<-rename(tfc, var2=col2)

mpg_cp<-mpg
mpg_cp<-rename(mpg_cp, city=cty)
mpg_cp<-rename(mpg_cp, highway=hwy)
mpg_cp$drvavg <- (mpg_cp$city+mpg_cp$highway)/2
hist(mpg_cp$drvavg)

View(mpg_cp)
# 합격판정 변수
mpg_cp$test<-ifelse(mpg_cp$drvavg>=20,'pass','fail')
# 빈도표로 합격 판정 수 보기
table(mpg_cp$test)
class(table(mpg_cp$test))
as.vector(table(mpg_cp$test))

qplot(mpg_cp$test)

#ifelse로 grade나누기
mpg_cp$grade<-ifelse(mpg_cp$drvavg>=30,'A',(ifelse(mpg_cp$drvavg>=20,'B','C')))
qplot(mpg_cp$grade)

