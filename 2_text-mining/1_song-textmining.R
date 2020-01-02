rm(list=ls())

getwd()
setwd("C:/Users/onycom/Desktop/DataAnalysis/DoIt-R/2_text-mining")

getwd()

library(rJava)
library(memoise)
library(KoNLP)
library(stringr)
library(wordcloud)
library(RColorBrewer)

useNIADic()

txt = readLines("C:/Users/onycom/Desktop/DataAnalysis/DoIt-R/Doit_R-master/Doit_R-master/Data/hiphop.txt")
head(txt,30)


txt = str_replace_all(txt, "\\W", " ") ## \\W 는 특수문자를 의미하는 정규 표현식이다.

nouns = extractNoun(txt)
nouns
wordcount = table(unlist(nouns))
wordcount

df_word = as.data.frame(wordcount, stringAsFactors = F)

df_word = rename(df_word,
                 word = Var1,
                 freq = Freq)
head(df_word)
class(df_word$word)
df_word$word = as.character(df_word$word)

df_word = filter(df_word, nchar(word) >= 2)
head(df_word)

top20 = df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top20



pal = brewer.pal(8, "Dark2")

set.seed(1234)

wordcloud(words = df_word$word ,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4,0.3),
          colors = pal)

# 단어 색상 바꾸기

pal = brewer.pal(9, "Blues")[5:9]

set.seed(1234)

wordcloud(words = df_word$word ,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4,0.3),
          colors = pal)


