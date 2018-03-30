exdata<-function(){
  library(readxl);
  #data<-read_excel('excel_exam_nohead.xlsx', col_names = F);
  data<-read_excel('excel_exam_3.xlsx', sheet=2);
  return (data);
}





data<-exdata()

colnames(data)<-c('a','a','a','a','a')

data$avg <-round(rowMeans(data[,c(4:6)]),2)

