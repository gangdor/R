library('ggplot2')
midwest
class(midwest)
#변수 수정
midwest<-rename(midwest, total=poptotal)
midwest<-rename(midwest, asian=popasian)

#
midwest$asian_per <- round((midwest$asian/midwest$total)*100,1)
hist(midwest$asian_per)

asian_total_avg<-sum(midwest$asian)/sum(midwest$total)*100
asian_total_avg<-mean(midwest$asian_per)

midwest$avgcheck <- ifelse(midwest$asian_per>asian_total_avg,"large","small")

table(midwest$avgcheck)
tmp<-as.vector(table(midwest$avgcheck))
qplot(midwest$avgcheck)

#============R에서 SQL사용하기===========
library('sqldf')
mympg <- sqldf('select *, (cty+hwy)/2 as total from mpg')
View(mympg)

mympg$test <- sqldf('select case when total > 20 then "pass" else "fail" end as test from mympg')
