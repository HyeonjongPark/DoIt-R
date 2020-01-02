class(welfare$birth)
summary(welfare$birth)

qplot(welfare$birth)

# 파생변수 만들기

welfare$age = 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)


# 나이에 따른 월급 평균표 만들기

age_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))

age_income

# 나이에 따른 월급 평균 그래프
ggplot(data = age_income , aes(x = age, y=mean_income)) + geom_line()




