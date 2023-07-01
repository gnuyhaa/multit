# 별자리 상관계수 
# 

library(dplyr)
library(ggplot2)
zodiac<- read.csv('zodiac_mbti.csv')

str(zodiac)
zo <- zodiac[, c(2,4,5)]

zo1 <- zo # 데이터 복제 

View(zo1)


#############################
# 
# x mbti
# y 별자리 
# 히트맵 빈도수 
# 별자리를 빈도표로 

# 'Aries','Taurus','Gemini','Cancer','Leo','Virgo', 
# 'Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces',


#############################
table(zo1$type)
table(zo1$mbti)

xtabs(~ mbti, data=zo1, subset=type == 'Aries')

# 절대 빈도표 
freqmbti <- xtabs(~ mbti, data=zo1)
freqtype <- xtabs(~ type, data=zo1)

# 상대 빈도표 만들기 
round(proportions(freqmbti)*100, digits = 2)
round(proportions(freqtype)*100, digits = 2)

reorder(zo1$type, zo1$type, length)

pie(freqtype, main='별자리')
pie(freqmbti, main='mbti')

### 범주형 변수의 상관성을 수치로 요약하기 - 교차표 만들기
table(zo1$mbti, zo1$type)

freqMbtiType <- xtabs(~ type + mbti, data=zo1)
freqMbtiType

# 교차표에서 빈도표 구하기
marginSums(freqMbtiType)
marginSums(freqMbtiType, margin=1)
marginSums(freqMbtiType, margin=2)

# 상대빈도로 교차표 구하기
proportions(freqMbtiType)
round(proportions(freqMbtiType,1)*100, digits = 2) # mbti로 별자리 비율
round(proportions(freqMbtiType,2)*100, digits = 2) # 별자리로 mbti 비율 


chisq.test(freqMbtiType)
# 	Pearson's Chi-squared test
# 
# data:  freqMbtiType
# X-squared = 152.35, df = 165, p-value = 0.7512 귀무가설 채택 

heatmap(freqMbtiType, scale = 'row') # 행 기준 

