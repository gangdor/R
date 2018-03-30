kim <- c(80,90,70,100)
names(kim)<-c('ko','en','si','ma')
kim

lee <- c(80,99,78,72)
names(lee)<-c('ko','en','si','ma')

hong <- c(90,78,82,78)
names(hong)<-c('ko','en','si','ma')

jang <- c(99,89,78,90)
names(jang)<-c('ko','en','si','ma')

student <- c(mean(kim),mean(lee),mean(hong),mean(jang))
names(student)<-c('kim','lee','hong','jang')
student

subject <- c(mean(kim[1],lee[1],hong[1],jang[1]),
             mean(kim[2],lee[2],hong[2],jang[2]),
             mean(kim[3],lee[3],hong[3],jang[3]),
             mean(kim[4],lee[4],hong[4],jang[4])
             );

names(subject)<-c('ko','en','si','ma')

subject


m1 <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90), nrow=4, byrow = TRUE)

colnames(m1) <-c('ko','en','si','ma')
rownames(m1) <-c('kim','lee','hong','jang')

m1
arr1 <- c(mean(m1[,1]),mean(m1[,2]),mean(m1[,3]),mean(m1[,4]))
arr1
arr2 <- c(mean(m1[1,]),mean(m1[2,]),mean(m1[3,]),mean(m1[4,]))
arr2

rowMeans(m1)
colMeans(m1)
