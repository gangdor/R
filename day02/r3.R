c2<-c(1,2,3,NULL,5);
mean(c2, na.rm = T)
mean(c2)

c3<-c(1,2,3,NA,5);
mean(c3, na.rm = T) #Not Available.remove = True
mean(c3)

f1<-function(a,b){
  return (a+b);
}
f1(10,20)

cc<-c('1','1','1','1','1')
mean(cc)
mean(as.numeric(cc))

ccc<- c(12,43,84,25,101,70,60)
ccc[which(ccc%%2==0)]

str4 <- c('a','b','c','d')
s <- paste(str4,collapse = ' ')
s