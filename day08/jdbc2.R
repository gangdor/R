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
sqlstr <- '';
# 4. ResultSet
emp <- dbGetQuery(conn,sqlstr);
# 5. close
dbDisconnect(conn);

# emp회사의 근속연수와 월급의 상관관계를 그래프로 표현하시오
str(emp)
View(emp)
class(emp)
tmp<-substr(emp$HIREDATE,1,10)
tmp<-as.Date(tmp)

# 근속 월 구하기
now<-substr(Sys.Date(),1,10)
aa<-difftime(now,tmp,unit='days')/30
a<-as.Date(now)-as.Date(tmp)
emp$a<-round(a/30,0)

# 그래프그리기
library(ggplot2)
ggplot(data=emp, aes(x=a,y=SAL))+geom_line()