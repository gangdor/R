#=========================
# R - Oracle 연동하기
# 2018. 04. 04
#=========================
library(rJava)
library(RJDBC)
library(DBI)

# 1. Driver Loading
drvName <- 'oracle.jdbc.driver.OracleDriver';
id <- 'ruser';
pwd <- '111111';
url<-'jdbc:oracle:thin:@localhost:1521:XE';
drv <- JDBC(driverClass = drvName, classPath = 'c:/java_hive_lib/ojdbc6.jar');
# 2. Connection
conn <- dbConnect(drv,url,id,pwd);
# 3. Statement
selall <- 'select * from videogame';
sqlstr <- 'select SUM(GLOBAL_SALES) as ha, Platform from videogame group by platform order by ha desc';
# 4. ResultSet
videogame <- dbGetQuery(conn,sqlstr);
videoselall<- dbGetQuery(conn,selall);
videogame<- videogame[which(videogame$HA>0),]


# 5. close
dbDisconnect(conn);

# 
# 그래프그리기
library(ggplot2)
ggplot(data=videogame, aes(x=reorder(PLATFORM,HA),y=HA, fill=PLATFORM))+geom_col()+coord_flip()

