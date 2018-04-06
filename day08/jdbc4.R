library(rJava)
library(RJDBC)
library(DBI)

# Hive 연동 (Linux : server1)
drvName <- 'org.apache.hive.jdbc.HiveDriver';
id <- 'ruser'
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
sqlstr <- 'SELECT * FROM airline_delay LIMIT 10'

# 4. ResultSet
airline <- dbGetQuery(conn, sqlstr);

# 5. Close
dbDisconnect(conn)

