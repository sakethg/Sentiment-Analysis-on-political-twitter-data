library(tm)

setwd("C:/Users/uia91182/Desktop/aba project/datasets")
mydata <-read.csv("republicans_tweets (1).csv",stringsAsFactors = FALSE)

mydata_content <-paste(mydata$Content,collapse = " ")
mydata_source <- VectorSource(mydata_content)
corpus<- Corpus(mydata_source)

#cleaning
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, removeWords, c("amp", "rt", "tcot", "bit.ly", "tinyurl.com", "http","new","just","today"))

#making document term matrix
dtm <-DocumentTermMatrix(corpus)
dtm2 <-as.matrix(dtm)

#finding most frequent terms
frequency <- colSums(dtm2)
frequency <-sort(frequency,decreasing = TRUE)

install.packages('wordcloud')

library(wordcloud)

words <- names(frequency)

wordcloud(words[1:100],frequency[1:200])




#TOPIC MODELLING

install.packages("RTextTools", repos = "https://cran.r-project.org")
install.packages("tm", repos = "https://cran.r-project.org")
install.packages("topicmodels", repos = "https://cran.r-project.org")
install.packages("slam", repos = "https://cran.r-project.org")



library(RTextTools)
library(tm)



library(wordcloud)
library(topicmodels)
library(slam)
data <- mydata[1:38415,] # We perform LDA on the tweets 1 through 1000 in the data.

corpus <- Corpus(VectorSource(data$Content), readerControl=list(language="en"))



tweet_dtm <- DocumentTermMatrix(corpus, control = list(stopwords = TRUE, minWordLength = 3, removeNumbers = TRUE, removePunctuation = TRUE))
tweet_dtm


#to find the value of K to run LDA
install.packages("ldatuning")

install.packages("devtools")
devtools::install_github("nikita-moor/ldatuning")


library("ldatuning")


library("topicmodels")
data("AssociatedPress", package="topicmodels")
dtm <- AssociatedPress[,]



resultrepub_full <- FindTopicsNumber(
  dtm,
  topics = seq(from = 2, to = 25, by = 1),
  metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
  method = "Gibbs",
  control = list(seed = 77),
  mc.cores = 2L,
  verbose = TRUE
)


write.csv(resultrepub_full, "LDATUNINGRESULT_FULLDATA_alltopics.csv")


FindTopicsNumber_plot(resultrepub_full)


corpus <- Corpus(VectorSource(data$content), readerControl=list(language="en"))
tweet_dtm <- DocumentTermMatrix(corpus, control = list(stopwords = TRUE, minWordLength = 3, removeNumbers = TRUE, removePunctuation = TRUE))
tweet_dtm

rowTotals <- apply(dtm , 1, sum) #Find the sum of words in each Document
dtm.new   <- dtm[rowTotals> 0, ] 

lda <- LDA(dtm.new, k = 13, control = list(seed = 1234))
lda



library(tidytext)
lda_td <- tidy(lda)
lda_td



library(ggplot2)
library(dplyr)

top_terms <- lda_td %>%
  group_by(topic) %>%
  top_n(15, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

