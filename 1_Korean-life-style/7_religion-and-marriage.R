
# 종교 유무에 따른 이혼율
class(welfare$religion)

table(welfare$religion)

welfare$religion = ifelse(welfare$religion == 1 , "yes", "no")
table(welfare$religion)

qplot(welfare$religion)


class(welfare$marriage)
table(welfare$marriage)

welfare$marriage = ifelse(welfare$marriage == 1 , "marriage" ,
                          ifelse(welfare$marriage == 3 , "divorce", NA))

table(welfare$marriage)

table(is.na(welfare$marriage))

qplot(welfare$marriage)



## 종교 유무에 따른 이혼율 표


religion_marriage = welfare %>% 
  filter(!is.na(marriage)) %>% 
  group_by(religion, marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 1))

religion_marriage


# 이혼 추출

divorce = religion_marriage %>% 
  filter(marriage == "divorce") %>% 
  select(religion, pct)

divorce





