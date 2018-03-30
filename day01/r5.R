c1 <- c(1:5);
c2 <- c(1:5);
cs <- union(c1,c2)
cs2 <- setequal(c1,c2)
cs2

result <- c(1:3) %in% cs
print(length(result))
9 %in% cs

c3 <- seq(1,1000,5)
c3

m1 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3)
m2 <- matrix(c(1,2,3,4,5,6,7,8,9), ncol=3)
m1
m2
colnames(m1) <-c('c1','c2','c3')
rownames(m1) <-c('r1','r2','r3')

m1[c(1,2),3]
m1*m1
t(m1)
m1[,1]