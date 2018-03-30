library('dplyr')
exam<-read.csv('csv_exam.csv')
# exam에서 class가 1인 경우만 추출해 출력
exam %>% filter(class==1)
# 같은 표현
c1<- exam[exam$class==1 & exam$math>50,]
c2<-sqldf('select * from exam where math>50 and class==1')

exam %>% filter(class %in% c(1,3,5))

# 실습
car1<-mpg %>% filter(displ<=4)
car2<-mpg %>% filter(displ>5)
avg <- mean(car1$hwy)
avg2 <- mean(car2$hwy)
avg3 <- aggregate(hwy~displ,mpg,mean)
class(avg3)
avg4 <- colMeans(avg3[avg3$displ<=4,])
avg5 <- colMeans(avg3[avg3$displ>5,])
avg6 <- mean(avg3[avg3$displ>5,2])


car3<-mpg %>% filter(manufacturer=='audi')
car4<-mpg %>% filter(manufacturer=='toyota')
cty_avg1 <- mean(car3$cty)
cty_avg2 <- mean(car4$cty)
aggregate(cty~manufacturer,mpg,mean)

car5<-mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda'))
hwy_avg <- mean(car5$hwy)


tmp<-aggregate(hwy~displ <=4,mpg,mean)
qplot(tmp$hwy,x=c('5<=','4>='))