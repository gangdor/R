#=======================
# 종교에 따른 이혼율
#=======================
class(welfare$religion)
table(welfare$religion)
welfare$religion<-ifelse(welfare$religion==1,'yes','no')
table(welfare$religion)
qplot(welfare$religion)

class(welfare$marriage)
table(welfare$marriage)
welfare$group_marriage<-ifelse(welfare$marriage==1,'marriage',ifelse(welfare$marriage==3,'divorce',NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

religion_marriage<-welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n=n())%>% 
  mutate(tot_group=sum(n))%>%
  mutate(pct=round(n/tot_group*100,1))

religion_marriage<-welfare%>%
  filter(!is.na(group_marriage))%>%
  count(religion, group_marriage)%>%
  group_by(religion)%>%
  mutate(pct=round(n/sum(n)*100,1))

divorce<-religion_marriage%>%filter(group_marriage=='divorce')%>%select(religion,pct)
divorce

ggplot(data=divorce, aes(x=religion, y=pct))+geom_col()

age_marriage <- welfare %>%
  filter(!is.na(group_marriage))%>%
  group_by(ageg,group_marriage)%>%
  summarise(n=n())%>%
  mutate(tot_group=sum(n))%>%
  mutate(pct=round(n/tot_group*100,1))

age_marriage

age_divorce<-age_marriage %>%
  filter(ageg!='young'&group_marriage=='divorce')%>%
  select(ageg,pct)

ggplot(data=age_divorce, aes(x=ageg, y= pct))+geom_col()

# 연령대 및 종교 유무에 따른 이혼율 표 만들기
ageg_religion_marriage<-welfare%>%
  filter(!is.na(group_marriage) & ageg!='young')%>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group=sum(n)) %>%
  mutate(pct=round(n/tot_group*100,1))

df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage=='divorce')%>%
  select(ageg,religion,pct)

df_divorce

ggplot(data=df_divorce, aes(x=ageg,y=pct,fill=religion))+
  geom_col(position='dodge')