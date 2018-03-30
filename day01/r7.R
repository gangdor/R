#r7
name <- c('lee','kim','park','jang','hong');
age <- c(10,20,30,40,50);
weight <-c(40,50,60,70,80)
df <- data.frame(name, age, weight)
df
dim(df)
nrow(df)
ncol(df)
typeof(df)

df2<-df[c(1:3),]
colMeans(df2[,c('age','weight')])

df$name
max(df$age[1:3])

c <- df$age
c
50 %in% c
which(df$age==50)

mx<-which(df$age == max(df$age))
mn<-which(df$age == min(df$age))
mx
c[-10]
v2 <- mean(c[c(-mx,-mn)])
v2

df$height <- c(180,170,160,150,155)
df$bmi <- c(df$weight/(df$height*df$height)*10000)
df$bmi <- c(df$weight/(df$height^2)*10000)

#무게가 50이상인 사람 중에
df2<-df[df$weight<=50 & df$weight>=30,]
#키가 가장 큰사람은?
df2[which(df$height == max(df$height)),]