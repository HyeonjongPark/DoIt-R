

twitter = read.csv("C:/Users/onycom/Desktop/DataAnalysis/DoIt-R/Doit_R-master/Doit_R-master/Data/twitter.csv",
                   header = T,
                   stringsAsFactors = F,
                   fileEncoding = "UTF-8")

head(twitter)
colnames(twitter)
twitter = rename(twitter , 
                 no = 번호,
                 id = 계정이름,
                 date = 작성일,
                 tw = 내용)

# 특수문자 제거

twitter$tw = str_replace_all(twitter$tw , "\\W", " ")

nouns = extractNoun(twitter$tw)
wordcount = table(unlist(nouns))

df_word = as.data.frame(wordcount ,
                        stringsAsFactors = F);head(df_word)

df_word = rename(df_word,
                 word = Var1,
                 freq = Freq)

df_word = filter(df_word, nchar(word) >= 2)
head(df_word)

top20 = df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)
top20



order = arrange(top20, freq)$word

ggplot(data = top20, aes(x=word, y=freq)) +
  ylim(0,2500) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limit = order) + 
  geom_text(aes(label = freq) , hjust = -0.3) # 빈도 표시


pal = brewer.pal(8,"Dark2")  
set.seed(1234)

wordcloud(words = df_word$word ,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(6,0.2),
          colors = pal)











