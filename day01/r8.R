ko <- c(80,80,90,99);
en <- c(90,99,78,89);
si <- c(70,78,82,78);
ma <- c(100,72,78,90)

df<-data.frame(ko,en,si,ma)
df$avg<-c(round(rowMeans(df),digits = 1))
df$sum<-c(rowSums(df))
df

#
cavg <- c(round(colMeans(df),digits = 1));
cavg
dftotal<-rbind2(df,cavg)

rownames(dftotal)<-c('kim','lee','hong','jang','cavg')
dftotal






