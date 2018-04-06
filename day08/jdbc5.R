library(rJava)
library(RJDBC)
library(DBI)
library(dplyr)
# weather data 분석
getweather<-function(){
  # Hive 연동 (Linux : server1)
  drvName <- 'org.apache.hive.jdbc.HiveDriver';
  id <- 'root'
  pwd <- '111111'
  url <- 'jdbc:hive2://192.168.111.100:10000'
  
  # 폴더에 있는 jar들을 class path로 사용한다
  hive_lib <- 'c:\\java_hive_lib'
  .jinit();
  .jaddClassPath(dir(hive_lib, full.names = T));
  .jclassPath();
  
  
  # 1. Driver Loading
  drv <- JDBC(driverClass = drvName, 
              classPath = 'hive-jdbc-1.0.1.jar')
  
  # 2. Connection
  conn <- dbConnect(drv, url, id, pwd)
  
  # 3. Statement 
  sqlstr <- 'SELECT date, AVG(sky), SUM(rain) FROM weather GROUP BY date'
  
  # 4. ResultSet
  weather <- dbGetQuery(conn, sqlstr);
  weather<-rename(weather, DAY=date, sky='_c1', rain='_c2')
  #state=0은 맑음, 1은 흐림, 2는 눈비
  weather$state<-ifelse(weather$rain>=3,2,ifelse(weather$sky>=3,1,0))
  weather$DAY<-as.Date(weather$DAY, format="%Y-%m-%d")
  
  # 5. Close
  dbDisconnect(conn)
  return(weather);
}
#get weather



#get delivery
getdel<-function(){
  #=========================
  # R - Oracle 연동하기
  # 2018. 04. 04
  #=========================
 
  # 1. Driver Loading
  drvName <- 'oracle.jdbc.driver.OracleDriver';
  id <- 'ruser';
  pwd <- 'ruser';
  url<-'jdbc:oracle:thin:@70.12.114.144:1521:XE';
  drv <- JDBC(driverClass = drvName, classPath = 'c:/java_hive_lib/ojdbc6.jar');
  # 2. Connection
  conn <- dbConnect(drv,url,id,pwd);
  # 3. Statement
  sqlstr <- 'select * from food2';
  # 4. ResultSet
  delivery <- dbGetQuery(conn,sqlstr);
  delivery<-rename(delivery, DAY=癤풡AY)
  delivery2 <- aggregate(CALLS~DAY+FOOD, delivery, sum)
  delivery2$DAY<-as.Date(delivery2$DAY, format="%Y-%m-%d")
  # 5. close
  dbDisconnect(conn);
  return(delivery2);
}

weather<-getweather()
result <- getdel()
result <- left_join(result, weather, id = "DAY")

library(ggplot2)
result2<-aggregate(CALLS~state+FOOD, result, mean)
result2$states <- ifelse(result2$state == 2, '눈/비',
                         ifelse(result2$state == 1, '흐림', '맑음'))



p<-ggplot(result2, aes(x=states, y=CALLS, col=FOOD))+geom_point()
library(plotly)
ggplotly(p)



