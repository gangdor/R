install.packages('readxl')
install.packages('foreign')
# SPSS파일불러오기
library(foreign)
# 전처리
library(dplyr)
# 시각화
library(ggplot2)
# 엑셀파일 불러오기
library(readxl)
# 데이터불러오기
raw_welfare<-read.spss(file='Koweps_hpc10_2015_beta1.sav', to.data.frame = T)
# 복제
welfare<-raw_welfare
str(welfare)
length(colnames(welfare))

welfare<-rename(welfare,sex=h10_g3,
                birth=h10_g4,
                marriage=h10_g10,
                religion=h10_g11,
                income=p1002_8aq1,
                code_job=h10_eco9,
                code_region=h10_reg7)

str(welfare)
table(is.na(welfare$sex))
table(welfare$sex)
qplot(welfare$sex)

welfare$sex<- ifelse(welfare$sex==1,'male','female')
table(welfare$sex)
qplot(welfare$sex)