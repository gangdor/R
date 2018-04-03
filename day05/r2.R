library(dplyr)
View(mpg)
mpg2<-mpg[,c('drv','hwy')]
result<-aggregate(hwy~drv,mpg,mean)
# 크기순으로 정렬하기
ggplot(data=result, aes(x = reorder(drv,-hwy), y=hwy))+geom_col()+geom_line()
# 빈도막대그래프
ggplot(data=mpg, aes(x=drv)) +geom_bar()
class(mpg)

#p193 실습1
q1<-mpg %>% group_by(class, manufacturer) %>% filter(class=='suv') %>% summarise(mcty=mean(cty)) %>% arrange(desc(mcty))%>%head(5)
ggplot(data=q1, aes(x=reorder(manufacturer,mcty),y=mcty)) + geom_col()
#2
ggplot(data=mpg, aes(x=class))+geom_bar()
q2<-table(mpg$class)
q2<-as.data.frame(q2)
names(q2)<-c('class','count')
ggplot(data=q2, aes(x=class, y=count))+geom_col()



