#===========================================
# 통신사별 wifi 위치 정보를 서울에 찍어보자
#===========================================
data<-read.csv('wifi_location2.csv',header = F)
# 전체 wifi data
wifi<-data[,c(4:6)]

library(RgoogleMaps)
library(dplyr)

#KT
kt<-wifi%>%filter(V6=='KT')
#SKT
skt<-wifi%>%filter(V6=='SKT')
#LGU+
lg<-wifi%>%filter(V6=='LGU+')

mycenter = c(37.551632, 126.986137)
mymap <- GetMap(
  center = mycenter,
  zoom = 11,
  maptype = 'load',
  format = 'roadmap'
)


aaa<-function(a){
  if(a==1){ #kt
    # jpeg 를 먼저 선언해야 아래를 그릴 수 있다.
    jpeg(filename = "KT.jpg", width = 680, height = 680)
    p <- PlotOnStaticMap(mymap,
                         lat = kt$V5,
                         lon = kt$V4,
                         #destfile = 'KT.jpg',
                         cex = 1,
                         pch = 10,
                         col = 'red');
  }else if(a==2){ #lg
    jpeg(filename = "LG.jpg", width = 680, height = 680)
    p <- PlotOnStaticMap(mymap,
                         lat = lg$V5,
                         lon = lg$V4,
                         #destfile = 'LG.jpg',
                         cex = 1,
                         pch = 10,
                         col = 'red');
  }else{ #skt
    jpeg(filename = "SKT.jpg", width = 680, height = 680)
    p <- PlotOnStaticMap(mymap,
                         lat = skt$V5,
                         lon = skt$V4,
                         #destfile = 'SKT.jpg',
                         cex = 1,
                         pch = 10,
                         col = 'red');
  }
  
  print(p)
  dev.off()
}

aaa(1)
aaa(2)
aaa(3)

