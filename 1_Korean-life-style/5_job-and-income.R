
class(welfare$code_job)
table(welfare$code_job) # 직업코드가 어떤 직업을 의미하는지 모른다.

getwd()
library(readxl)

# 엑셀 파일 로드 명령어 - read_excel // 시트 번호도 지정가능
list_job = read_excel("C:/Users/onycom/Desktop/DataAnalysis/DoIt-R/Doit_R-master/Doit_R-master/Data/Koweps_Codebook.xlsx", sheet = 2)
list_job


welfare = left_join(welfare, list_job, id = "code_job")

welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)


job_income =  welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))

head(job_income)


## 상위 연봉 탑 텐 그래프

top10 = job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

top10


ggplot(top10, aes(x = reorder(job, mean_income), y= mean_income)) + 
  geom_col() + 
  coord_flip()


## 하위 연봉 탑 텐 그래프

bottom10 = job_income %>% 
  arrange(mean_income) %>% 
  head(10)

bottom10

ggplot(bottom10, aes(x = reorder(job, mean_income), y = mean_income)) + 
  geom_col() +
  coord_flip() + 
  ylim(0,850)






