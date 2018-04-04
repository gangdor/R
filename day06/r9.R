# 노년층이 많은 지역은 어딜까?

library(ggplot2)
library(dplyr)
list_region<- data.frame(code_region=c(1:7),
                         region=c('서울',
                                  '수도권(인천/경기)',
                                  '부산/경남/울산',
                                  '대구/경북',
                                  '대전/충남',
                                  '강원/충북',
                                  '광주/전남/전북/제주도'))
list_region

# 지역변수명 추가
welfare<-left_join(welfare, list_region, id='code_region')
welfare %>% select(code_region, region) %>% head

# 지역별 연령대 비율 분석
region_ageg<-welfare%>%group_by(region,ageg) %>%
  summarise(n=n()) %>%
  mutate(tot_group=sum(n)) %>%
  mutate(pct=round(n/tot_group*100,2))

head(region_ageg)

ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg))+
  geom_col()+coord_flip()

list_order_old<- region_ageg %>%
  filter(ageg=='old') %>%
  arrange(pct)

list_order_old

order<-list_order_old$region
order

ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg))+
  geom_col()+coord_flip()+scale_x_discrete(limits=order)

region_ageg$ageg<-factor(region_ageg$ageg, level=c('old','middle', 'young'))
class(region_ageg$ageg)
levels(region_ageg$ageg)
ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg))+
  geom_col()+
  coord_flip()+
  scale_x_discrete(limits=order)
order<-list_order_old$region
order
