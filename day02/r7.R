getcsv<-function(){
  library(readxl);
  data <- read.csv('csv_exam3.csv', header = F, stringsAsFactors = F, encoding='UTP8');
  class(data$v2)
   return (data);
}
data<-getcsv()
data$avg <-round(rowMeans(data[,c(4:6)]),2)

colnames(data)<-c('a','b','c','d','e','f','g')

writedata<-function(df){
  write.csv(df,file='result0329');
}
writedata(data)

newdata <- read.csv('result0329', header = F, stringsAsFactors = F, encoding='UTP8')