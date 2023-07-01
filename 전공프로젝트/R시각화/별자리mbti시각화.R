library(dplyr)
library(ggplot2)
# install.packages('gridExtra')
library(gridExtra)

zodiac<- read.csv('zodiac_mbti.csv')
View(zodiac)

ggplot(data=zodiac, aes(x=mbti))+
  geom_bar() # istj가 가장 많은 비율 차지 

# 별자리별 mbti 분포 
zodiac[, c(2,5)] %>% 
  group_by(type)

zodiac_count <- zodiac[, c(2,5)] %>% 
  group_by(type,mbti) %>% 
  summarize(count=n())
# A tibble: 12 × 2
# type        count
# <chr>       <int>
# 1 Aquarius      259
# 2 Aries         102
# 3 Cancer         32
# 4 Capricorn     251
# 5 Gemini        110
# 6 Leo            28
# 7 Libra           4
# 8 Pisces        209
# 9 Sagittarius   205
# 10 Scorpio       234
# 11 Taurus         63
# 12 Virgo          40

View(zodiac_count)

# 각 별자리 mbti 분포 
Ari_mbti <- zodiac_count[zodiac_count$'type' == 'Aries',] # 양자리 
Tau_mbti <- zodiac_count[zodiac_count$'type' == 'Taurus',] # 황소자리 
Gem_mbti <- zodiac_count[zodiac_count$'type' == 'Gemini',] # 쌍둥이자리
Cac_mbti <- zodiac_count[zodiac_count$'type' == 'Cancer',] # 게자리 
Leo_mbti <- zodiac_count[zodiac_count$'type' == 'Leo',] # 사자자리 
vir_mbti <- zodiac_count[zodiac_count$'type' == 'Virgo',] # 처녀자리 
Lib_mbti <- zodiac_count[zodiac_count$'type' == 'Libra',] # 천칭자리
Sco_mbti <- zodiac_count[zodiac_count$'type' == 'Scorpio',] # 전갈자리
Sgr_mbti <- zodiac_count[zodiac_count$'type' == 'Sagittarius',] # 궁수자리
Cap_mbti <- zodiac_count[zodiac_count$'type' == 'Capricorn',]# 염소자리
Aqu_mbti <- zodiac_count[zodiac_count$'type' == 'Aquarius',] # 물병자리
Psc_mbti <- zodiac_count[zodiac_count$'type' == 'Pisces',]# 물고기자리

# 시각화
Ari <- ggplot(Ari_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("양자리 mbti")+
  theme(legend.position = 'none')

Tau <- ggplot(Tau_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("황소자리 mbti")+
  theme(legend.position = 'none')

Gem <- ggplot(Gem_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("쌍둥이자리 mbti")+
  theme(legend.position = 'none')

Cac <- ggplot(Cac_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("게자리 mbti")+
  theme(legend.position = 'none')

Leo <- ggplot(Leo_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("사자자리 mbti")+
  theme(legend.position = 'none')

vir <- ggplot(vir_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("처녀자리 mbti")+
  theme(legend.position = 'none')

Lib<- ggplot(Lib_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("천칭자리 mbti")+
  theme(legend.position = 'none')

Sco <- ggplot(Sco_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("전갈자리 mbti")+
  theme(legend.position = 'none')

Sgr <- ggplot(Sgr_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("궁수자리 mbti")+
  theme(legend.position = 'none')

Cap <- ggplot(Cap_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("염소자리 mbti")+
  theme(legend.position = 'none')

Aqu <- ggplot(Aqu_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("물병자리 mbti")+
  theme(legend.position = 'none')

Psc <- ggplot(Psc_mbti, aes(x=mbti, y=count, fill=mbti))+
  geom_bar(stat='identity')+
  ggtitle("물고기자리 mbti")+
  theme(legend.position = 'none')

grid.arrange(Ari, Tau, Gem, Cac, Leo, vir, Lib, Sco, Sgr, Cap, Aqu, Psc, ncol=4, nrow=3)

# intp, intj, infp, infj
# enfp, entp, istp, enfj
# entj, istj, isfp, estp
# esfp, isfj, estj, esfj




