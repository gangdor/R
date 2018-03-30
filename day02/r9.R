View(seoulair)
head(seoulair)
tmp<-seoulair[,c(1,7)]
class(tmp)
library(ggplot2)


tmp$add<-substr(tmp$측정일시,9,12)
colnames(tmp)<-c('date','finedust','time')
tmp2<-tmp[,c(2,3)]


ggplot(data = tmp2, aes(x=finedust, y=time))+geom_line()
mpg



