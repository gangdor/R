tf <- data.frame(
  id=c(1:5),
  test=c(86:90)
)

tf2 <- data.frame(
  id=c(6:10),
  test=c(91:95)
)

#rbind로 데이터프레임 합치기
total<-rbind(tf,tf2)

#column추가하기
total$test2<-c(90:99)

#avg column에 평균을 입력하시오
total$avg <- rowMeans(total[,c(2:3)])

#평균이 높은 순으로 top3를 조회하시오
# 1
library(dplyr)
total %>% arrange(desc(avg)) %>% head(3)
# 2
head(total[order(total$avg,decreasing = T),],3)

#평균이 전체평균 이상인 핵생을 조회하시오
totalavg <- mean(total[,4])
total %>% filter(avg>totalavg)