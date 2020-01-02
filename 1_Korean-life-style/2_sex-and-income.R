
class(welfare$sex)
table(welfare$sex) # 1 : 남자 , 2 : 여자

# 성별에 결측치 9가 있는 경우 NA로 처리

welfare$sex = ifelse(welfare$sex == 9 , NA , welfare$sex)
table(is.na(welfare$sex))

welfare$sex = ifelse(welfare$sex == 1 , "male", "female")

qplot(welfare$sex)


class(welfare$income)
summary(welfare$income)


qplot(welfare$income) + xlim(0,1000)

welfare$income = ifelse(welfare$income %in% c(0,9999), NA, welfare$income) # 0 또는 9999 인 경우 NA 로 대체

table(is.na(welfare$income))


sex_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))

sex_income


ggplot(data = sex_income , aes(x = sex, y = mean_income)) + geom_col()


