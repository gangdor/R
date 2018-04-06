
library(sqldf) #sql을 R에서도 사용할 수 있는 라이브러리
View(iris)
str(iris)
mydata<-sqldf("select *from iris where Species='setosa'")
library(dplyr)
mydata2<-iris%>%filter(Species=='setosa')
mydata3<-iris[which(iris$Species=='setosa'),]


#종별로 그룹지어서, 모든 열의 평균을 구하라
#방법1(dplyr사용)
mydata4<-iris%>%group_by(Species)%>%summarise(mean_SLength=mean(Sepal.Length),mean_Swidth=mean(Sepal.Width),mean_Plength=mean(Petal.Length),mean_Pwidth=mean(Petal.Width))
#방법2(dplyr사용)
mydata4<-iris%>%group_by(Species)%>%summarise_all(mean)
#방법3(sqldf사용)
mydata5<-sqldf('select Species, avg("Sepal.Length"),
                       avg("Sepal.Width"),
                       avg("Petal.Length"),
                       avg("Petal.Width")
               from iris group by Species')

library(ggplot2)
ggplot(data=iris,aes(x=Sepal.Length, y=Petal.Length))+geom_line()
