## 데이터 경로
# C:\Users\onycom\Desktop\DataAnalysis\DoIt-R\Doit_R-master\Doit_R-master\Data

# 1. 경로 설정

getwd()
setwd("./1_Korean-life-style")

# 2. 패키지 설치 및 로드
install.packages("data.table")
install.packages("foreign")

library(data.table)
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 3. 데이터 로드
raw_welfare = read.spss(file ="C:/Users/onycom/Desktop/DataAnalysis/DoIt-R/Doit_R-master/Doit_R-master/Data/Koweps_hpc10_2015_beta1.sav",to.data.frame = T)

welfare = raw_welfare # 복사본 생성


# 4. 데이터 검토

head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)


# 5. 변수명 변경
# -> 분석에 사용할 7개의 변수의 이름을 쉬운 단어로 변경
welfare <- rename(welfare,
                  sex = h10_g3,          # 성별
                  birth = h10_g4,        # 태어난 년도 
                  marriage = h10_g10,    # 혼인 상태
                  religion = h10_g11,    # 종교
                  income = p1002_8aq1,   # 월급 
                  code_job = h10_eco9,   # 직업 코드
                  code_region = h10_reg7 # 지역 코드
                  )




