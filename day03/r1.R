library('googleVis')
head(Fruits)
class(Fruits)
banana<- Fruits[Fruits$Fruit == 'Bananas',]
result <- sum(banana$Sales)

# group by 와 같은 역할
# aggregate(계산될 데이터~데이터기준, 데이터, 함수)
df1 <- aggregate(Profit~Fruit+Year,Fruits,sum)
df2 <- Fruits[,c(4:6)]

# apply(matrix or array, 1 or 2, function)
# 1은 행 적용, 2는 열 적용
apply(df2,c(1,2),sum)

# 년도별, 월별 sales합 substr(Fruits[,7],6,7)
df3 <- Fruits[,c(2,4,6,7)]
df3$Month <- substr(Fruits[,7],6,7)
df4 <- df3[,c(1,2,3,5)]
df5 <- aggregate(Sales ~ Year+Month,df4,sum)
df6 <- aggregate(Profit ~ Year+Month,df4,sum)
df5$Psales <-round(((df5$Sales - df6$Profit)*1.83),1)

# Calculate a new column which called tax by Year, Month
df5$tax <- round(((df5$Sales - df6$Profit)*0.1),1)

df7<-df5[,c(1,2,5)]
#same expression
df7<-aggregate((Sales-Profit)*0.1~substr(Date,1,4)+substr(Date,6,7),Fruits,sum)
names(df7)<-c('Year','Month','Tax')
