name<-c('한지민','김연아','김경민','강필주');
gender<-c('f','f','m','m');
ko <- c(90,80,60,70);
en <- c(50,60,100,20);
ma <- c(87,54,79,89);
si <- c(54,67,87,88);
add <- c('서울시','광주시','대전시','부산시');
df <- data.frame(name,gender,ko,en,ma,si,add)
df

avgrow<- c(rowMeans(df[1:4]));
df$avgrow <- avgrow
df
avgcol<- c(colMeans(df[3:6]))
rbind(df, avgcol)

df2<-df[,c(3:6)]
submean<-colMeans(df2)
stumean<-rowMeans(df2)
names(stumean)<-df[,1]
qplot(data = submean, x=names(submean), y=submean)

temp <- df[,'add']
class(temp)
temp2 <- as.character(temp)
class(temp2)
df$add <- substr(temp2,1,2)
df$add2 <- substr(temp2,3,3)

dfm  <- df[df$gender=='f',]
dff  <- df[df$gender=='m',]
mavg <- colMeans(dfm[,c(3:6)])
favg <- colMeans(dfm[,c(3:6)])
qplot(y=mavg, x=names(mavg))

#평균 이상인 학생들 중 여자만 조회하기
total_avg <- mean(df[,8])
dfaa<-df[df$avgrow>total_avg & df$gender=='m',]

#학생 별 국어와 영어의 평균
df
tmp<-df[,c(3,4)]
tmp$avg<-rowMeans(tmp)
rownames(tmp)<-df$name
tmp
t(tmp)

#여학생드르이 과목 별 평균을 구하기
df

r1<- colMeans(df[df$gender=='f',][,c(3:6)])
names(r1)<-colnames(df[,c(3:6)])

result1<-df[df$gender=='f',]
r1 <- colMeans(result1[,c(3:6)])

result2<-df[df$gender=='m',]
r2 <- colMeans(result2[,c(3:6)])

result3<-rbind(r1,r2)
class(result3)
result4<-as.data.frame(result3)
class(result4)