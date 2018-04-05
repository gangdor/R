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
library(ggplot2)
useNIADic()

txt <- readLines('kakao.txt')
#특수문자 제거
txt <- str_replace_all(txt,'[0-9]',' ')
txt <- str_replace_all(txt,'오전',' ')
txt <- str_replace_all(txt,'오후',' ')
txt <- str_replace_all(txt,'김경민',' ')
txt <- str_replace_all(txt,'문주성',' ')
txt <- str_replace_all(txt,'임따거',' ')
txt <- str_replace_all(txt,'서원혁',' ')
txt <- str_replace_all(txt,'ㅋ',' ')
txt <- str_replace_all(txt,'ㄱ',' ')
txt <- str_replace_all(txt,'ㅂ',' ')
txt <- str_replace_all(txt,'ㅅ',' ')
txt <- str_replace_all(txt,'ㄴ',' ')
txt <- str_replace_all(txt,'ㅈ',' ')
txt <- str_replace_all(txt,'ㄷ',' ')
txt <- str_replace_all(txt,'ㅇ',' ')
txt <- str_replace_all(txt,'\\W',' ')
txt <- str_replace_all(txt,'  ','')
head(txt)

#명사만 추출하기
nouns<-extractNoun(txt)
#nouns는 리스트
class(nouns)
#리스트를 문자열 벡터로 변환 후 단어별 빈도표 생성
wordcount<-table(unlist(nouns))
class(wordcount)
#데이터프레임변환/ stringsAsFactors string들을 facotor로 넣을거야?
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
#변수명 수정
df_word <- rename(df_word, word=Var1, freq=Freq)
#두글자 이상 단어 추출
df_word <- filter(df_word, nchar(word)>=2)
top_20<- df_word %>% arrange(desc(freq)) %>% head(20)

#워드 클라우드 만들기
#install.packages('wordcloud')

library(RColorBrewer)
#Dark2 색상 목록에서 10개 색생 추출
pal <- brewer.pal(9,'Dark2')
set.seed(1234)


wc<-function(a){
  if(a==1){
    library(wordcloud)
    p<-wordcloud(words=df_word$word,   # 단어
              freq=df_word$freq,    # 빈도
              min.freq = 2,         # 최소단어 빈도
              max.words = 200,      # 표현 단어 수
              random.order = F,     # 고빈도 단어 중앙 배치
              rot.per = .1,         # 회전 단어 비율
              scale = c(4, 0.3),    # 단어 크기 범위
              colors = pal);        # 색상목록
    
    
    jpeg(filename = 'c:/rproject/day07/wordcloud.jpg', width=680, 
         height = 680, quality = 100);
    print(p)
  }else{
    order<-arrange(top_20,freq)$word
    p<-ggplot(data=top_20, aes(x=word, y=freq))+ geom_col()+coord_flip()+scale_x_discrete(limit=order)+geom_text(aes(label=freq), hjust=-0.3);
    
    jpeg(filename = 'c:/rproject/day07/barchart.jpg', width=680, 
         height = 680, quality = 100);
    print(p)
  }
  dev.off()
}

wc(1)
wc(2)


