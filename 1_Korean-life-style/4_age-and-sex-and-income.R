
sex_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income = mean(income))

sex_income

# 성별 연령대에 따른 월급 평균 - 비교가 힘들다
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() + 
  scale_x_discrete(limits = c("young","middle","old"))


# 비교가 쉬운 그래프 구성
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") + 
  scale_x_discrete(limits = c("young","middle","old"))




## 연령대가 아닌 실제 연령을 기준으로 그래프 출력

sex_age = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>% 
  summarise(mean_income = mean(income))

head(sex_age)

ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) +
  geom_line()
