#=============================
# interactive graph(2018.04.04)
#=============================
library(plotly)  # interactive graph를 위한 패키지
library(ggplot2)
library(htmlwidgets)
p<-ggplot(data=mpg, aes(x=displ,y=hwy,col=drv))+geom_point()
pp<-ggplotly(p)
# 
htmlwidgets::saveWidget(pp,file='mpg2.html')
