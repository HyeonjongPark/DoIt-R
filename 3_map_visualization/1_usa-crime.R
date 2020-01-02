## 미국 지도에 범죄율 시각화 ## 


setwd("C:/Users/onycom/Desktop/DataAnalysis/DoIt-R/3_map_visualization")

#install.packages("ggiraphExtra")
library(ggiraphExtra)
library(tibble)

str(USArrests)
head(USArrests)

crime = rownames_to_column(USArrests, var = "state") # 로우 인덱스를 컬럼으로 변경
head(crime)
crime$state = tolower(crime$state) # 대문자를 소문자로

str(crime)


library(ggplot2)
#install.packages("maps")
library(maps)
states_map = map_data("state")
str(states_map)


## 단계 구분도 만들기
#install.packages("mapproj")
library(mapproj)

ggChoropleth(data = crime ,
             aes(fill = Murder ,
                 map_id = state),
             map = states_map)




## 인터랙티브 단계 구분도 만들기

ggChoropleth(data = crime , 
             aes(fill = Murder,
                 map_id = state),
             map = states_map,
             interactive = T)
