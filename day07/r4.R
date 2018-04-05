library(ggiraphExtra)
library(kormaps2014)
library(dplyr)
library(ggplot2)
korpop1<-rename(korpop1, pop=총인구_명, name=행정구역별_읍면동)

# 인코딩을 CP949로 바꿈
str(changeCode(korpop1))
str(changeCode(kormap1))
options(encoding="UTF-8")
ggChoropleth(data=korpop1, aes(fill=pop,
                               map_id=code,
                               tooltip=name),
             map=kormap1, interactive=T)
