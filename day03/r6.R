#<aggregate와 group_by의 차이>>
aggregate(math~class,exam,mean)
#group by 를 통해서 반별 수학평균 구하기
exam %>% group_by(class) %>% summarise(mean_math=mean(math))
#groyp by는 aggregate와 달리 여러개의 변수를 지정할 수 있다.
exam %>% group_by(class) %>% summarise(mean_math=mean(math), 
                                   sum_english=sum(english), 
                                   mean_science=mean(science), 
                                   n=n())
exam

mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mcty=mean(cty)) %>% 
  arrange(desc(mcty)) %>%
  head(5)

#실습 p150
mpg %>% group_by(class) %>% summarise(avg_cty=mean(cty))

mpg %>% group_by(class) %>% summarise(avg_cty=mean(cty)) %>% arrange(desc(avg_cty))

mpg %>% group_by(manufacturer) %>% summarise(avg_hwy=mean(hwy)) %>% arrange(desc(avg_hwy)) %>% head(3)

mpg %>% filter(class=='compact') %>% group_by(manufacturer) %>% summarise(n=n()) %>% arrange(desc(n))

