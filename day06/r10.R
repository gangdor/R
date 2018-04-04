# 함수만들어서 그래프 저장하

g1 <- function(a){
  library(ggplot2)
  
  if(a==1){
    p = ggplot(data=mpg, aes(x=displ,y=hwy))+geom_col()
    jpeg(filename = 'c:/rproject/ais1.jpg', width=680, 
         height = 680, quality = 100);
  }
  else{
    p = ggplot(data=mpg, aes(x=displ,y=hwy))+geom_col()
    jpeg(filename = 'c:/rproject/aisnot1.jpg', width=680, 
         height = 680, quality = 100);
  }
  
  
  print(p)
  dev.off()    
}
