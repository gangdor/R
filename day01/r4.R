v1 <- c(70,80,90,100);
names(v1) <- c('ko','en','si','ma');
vv<-v1[1:4]

result <- mean(vv);
print(length(v1))
print(NROW(v1))

vv2 <- v1[c('ko','ma')]
vv2 <- v1[c(1,4)]
vv2 <- v1[c(-2:-3)]
vv2 <- v1[c(-2,-3)]
vv2