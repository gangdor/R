library(ggplot2)
midwest2<-midwest
View(midwest2)
# p160 실습
# 1. 전체인구대비 미성년 인구 백분율
midwest2$minor <- round(((midwest2$poptotal-midwest2$popadults)/midwest2$poptotal)*100,2)

# 2. 
library(dplyr)
midwest2 %>% group_by(county) %>% arrange(desc(minor)) %>% head(5)

# 3.
midwest2$minorgrader <- ifelse(midwest2$minor>=40,'large',(ifelse(midwest2$minor>=30,'middle','small')))
table(midwest2$minorgrader)
  
# 4.
midwest2$perasian<-round((midwest2$popasian/midwest2$popadults)*100,2)
midwest2 %>% select(state, county, perasian) %>% arrange(perasian) %>% head(10)
head(midwest2[order(midwest2$perasian),c('state','county','perasian')],10)