
library(stringi)

devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)

str(changeCode(korpop1)) # 데이터 인코딩이 UTF-8로 되어 있어서 윈도우에서 글자가 깨져 보일수도 있다 .
                         # 따라서 changeCode 를 사용해 인코딩을 CP949로 변환후 str에 적용하면 안깨진다.

library(dplyr)

korpop1 = rename(korpop1 ,
                 pop = 총인구_명,
                 name = 행정구역별_읍면동)

str(changeCode(kormap1))

ggChoropleth(data = korpop1,
             aes(fill = pop,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)




# 결핵 환자수 플러팅

str(changeCode(tbc))

ggChoropleth(data = tbc,
             aes(fill = NewPts,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)

head(changeCode(kormap1))



