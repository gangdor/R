library(ggplot2)
# 그래프 그리기
# 1. 산점도 그리기 / 1.1 배경 만들기
ggplot(data=mpg,aes(x = displ, y= hwy))
# 1.2 배경에 산점도 추가
ggplot(data=mpg,aes(x = displ, y= hwy)) + geom_point()
# 1.3 축 범위 지정하기
ggplot(data=mpg,aes(x = displ, y= hwy)) + geom_point() + xlim(3,6) + ylim(10,30)

# p188
# 1
ggplot(data=mpg, aes(x=cty, y=hwy)) + geom_point()
# 2
ggplot(data=midwest, aes(x=poptotal, y=popasian)) + geom_point() + xlim(0,500000) + ylim(0,10000)
fname<-'c:\rproject\mygrraph.png'
savePlot(filename=fname,type = 'png')