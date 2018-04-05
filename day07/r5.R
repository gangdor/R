library(RgoogleMaps)
mycenter = c(37.501322, 127.039749)

mymap <- GetMap(
  center = mycenter,
  zoom = 9,
  maptype = 'load',
  format = 'roadmap',
  destfile = 'mymap.jpg'
)

jpeg(filename = "mymap_poing.jpg", width = 680, height = 680)
# 지도 위에 뭔가 표시할 때
p <- PlotOnStaticMap(mymap,
                     lat = 37.501322,
                     lon = 127.039749,
                     destfile = 'mymap_plot.jpg',
                     cex = 1,
                     pch = 10,
                     col = 'red')

print(p)
dev.off()


##########################################################
# 위치 여러개
mydata <- data.frame(
  a = c(1:5),
  lat = c(37.501322, 37.801322, 37.001322, 35.501322, 58.501322),
  lon = c(127.039749,  127.089749, 127.139749, 157.039749,  87.039749)
)

jpeg(filename = "mymap_p.jpg", width = 680, height = 680)
# 지도 위에 뭔가 표시할 때
p <- PlotOnStaticMap(mymap,
                     lat = mydata$lat,
                     lon = mydata$lon,
                     destfile = 'mymap_plot.jpg',
                     cex = 1,
                     pch = 10,
                     col = 'red')

print(p)
dev.off()