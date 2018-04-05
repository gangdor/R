#=======================
# 텍스트마이닝(18.04.03)
#=======================
library(dplyr)
#install.packages('rJava')
#윈도우-고급설정-환경변수에 JAVA_HOME을 추가한다.
library(rJava)                
#install.packages('KoNLP')
library(KoNLP)                #
#install.packages('memoise')
library(memoise)              #
#install.packages('stringr')
library(stringr)              #특수문자제거
library(wordcloud)
library(RColorBrewer)
library(dplyr)
useNIADic()

txt1 <- readLines('http://www.yonhapnews.co.kr/bulletin/2018/04/01/0200000000AKR20180401008000007.HTML?from=search', encoding='UTF-8')

txt2<-readLines('http://www.yonhapnews.co.kr/bulletin/2018/04/03/0200000000AKR20180403058800007.HTML?from=search', encoding='UTF-8')

txt3<-readLines('http://www.yonhapnews.co.kr/bulletin/2018/03/13/0200000000AKR20180313028700007.HTML?from=search', encoding='UTF-8')

txt<-c(txt1,txt2,txt3)
txt<-gsub('[0-9]',' ',txt)
txt<-gsub('[a-z]',' ',txt)
txt<-gsub('[A-Z]',' ',txt)
txt<-gsub('_',' ',txt)
txt<-gsub('__',' ',txt)
txt<-gsub('\\W',' ',txt)
txt<-gsub('  ','',txt)

noun<-extractNoun(txt)
wc<-table(unlist(noun))
wr<-as.data.frame(wc,stringAsfactor=F)
class(wr)
wr<-rename(wr,word=Var1,freq=Freq)
wr<-filter(wr,nchar(as.character(wr$word))>=2)
top_10<- wr%>% arrange(desc(freq)) %>% head(10)
#Dark2 색상 목록에서 10개 색생 추출
pal <- brewer.pal(9,'Dark2')
set.seed(1234)

wordcloud(words=wr$word,   # 단어
          freq=wr$freq,    # 빈도
          min.freq = 2,         # 최소단어 빈도
          max.words = 200,      # 표현 단어 수
          random.order = F,     # 고빈도 단어 중앙 배치
          rot.per = .1,         # 회전 단어 비율
          scale = c(4, 0.3),    # 단어 크기 범위
          colors = pal)         # 색상목록

