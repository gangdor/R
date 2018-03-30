mpg2<-mpg[,c('model','year')]

# math제외
exam %>% select(-math)

# class가 1인 영어와 수학
exam[exam$class==1,c('english','math')]

#정렬
exam %>% arrange(math)
#같은표현
exam[order(exam$class,exam$english),]
exam %>% arrange(class,english)

exam3<-exam %>% arrange(desc(math))
head(exam3, 5)

#실습
exam$avg <- round(rowMeans(exam[,c(3:5)]),2)
exam %>% arrange(class,desc(avg))

tmp<-mpg %>% filter(manufacturer=='audi')
tmp %>% arrange(desc(hwy)) %>% head(5)


#실습 p.144
mpg_cp<-mpg
mpg_cp<-mpg_cp %>% mutate(total_ctyhwy = cty + hwy)
View(mpg_cp)
mpg_cp<-mpg_cp %>% mutate(avgctyhwy=total_ctyhwy/2)
mpg_cp %>% arrange(desc(avgctyhwy)) %>% head(3)
mpg_cp %>% mutate(total_ctyhwy = cty + hwy, avgctyhwy=total_ctyhwy/2) %>% arrange(desc(avgctyhwy)) %>% head(3)
