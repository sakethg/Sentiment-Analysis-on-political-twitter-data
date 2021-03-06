work_dir<-"C:/Users/uia91182/Desktop/aba project/datasets"
getwd()
setwd(work_dir)
#install.packages("data.table",repos = "https://cran.r-project.org")


#Read Data

library(data.table)


data <- fread("democrats_with_healthcare.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?") , stringsAsFactors = FALSE)
#View(data)
summary(data)


#install.packages("tidytext", repos = "https://cran.r-project.org")
#install.packages("dplyr", repos = "https://cran.r-project.org")


library(dplyr)
library(tidytext)

text_df <- data_frame(line = 1:436, text = data$x)

head(text_df)

if (!require("pacman")) install.packages("pacman")
pacman::p_load(sentimentr, dplyr, magrittr)

library("sentimentr")

library("syuzhet")


sentiment_value<-sentiment_by(data$x)
category_sentiments <- ifelse(sentiment_value < 0, "Negative", ifelse(sentiment_value > 0, "Positive", "Neutral"))

category_sentiments2 <- cbind(data$x,category_sentiments)
head(category_sentiments2)
category_sentiments 

table(category_sentiments)
category_sentiments
text_df

library("syuzhet")

words_df <- as.vector(text_df$text)
text_df

sentiment_df <- get_nrc_sentiment(words_df)

sentiment_df2 <- cbind(text_df, sentiment_df) 

head(sentiment_df2)

#getting positive sentiments

sentiment_value <- get_sentiment(words_df)

most_positive <- words_df[sentiment_value == max(sentiment_value)]

most_positive

#getting negative sentiments

most_negative <- words_df[sentiment_value <= min(sentiment_value)] 

most_negative 


sentiment_value

positive_tweets <- words_df[sentiment_value > 0]

head(positive_tweets)



negative_tweets <- words_df[sentiment_value < 0] 

head(negative_tweets)


neutral_tweets <- words_df[sentiment_value == 0] 
head(neutral_tweets)


# Alternate way to classify as Positive, Negative or Neutral tweets

category_sentiments <- ifelse(sentiment_value < 0, "Negative", ifelse(sentiment_value > 0, "Positive", "Neutral"))

head(category_sentiments)  

category_sentiments2 <- cbind(text_df,category_sentiments)
head(category_sentiments2)
category_sentiments 


table(category_sentiments)
category_sentiments
write.csv(category_sentiments, "category_sentiments_democrats_with_healthcare.csv")

#USING SYUZHET

library(dplyr)
library(tidytext)

text_df <- data_frame(line = 1:436, text = data$x)

head(text_df)

if (!require("pacman")) install.packages("pacman")
pacman::p_load(sentimentr, dplyr, magrittr)

library("sentimentr")

library("syuzhet")


sentiment_value<-sentiment_by(data$x)
category_sentiments <- ifelse(sentiment_value < 0, "Negative", ifelse(sentiment_value > 0, "Positive", "Neutral"))

category_sentiments2 <- cbind(data$x,category_sentiments)
head(category_sentiments2)
category_sentiments 

table(category_sentiments)
category_sentiments
text_df

library("syuzhet")

words_df <- as.vector(text_df$text)
text_df

sentiment_df <- get_nrc_sentiment(words_df)

sentiment_df2 <- cbind(text_df, sentiment_df) 

head(sentiment_df2)

#getting positive sentiments

sentiment_value <- get_sentiment(words_df)

most_positive <- words_df[sentiment_value == max(sentiment_value)]

most_positive

#getting negative sentiments

most_negative <- words_df[sentiment_value <= min(sentiment_value)] 

most_negative 


sentiment_value

positive_tweets <- words_df[sentiment_value > 0]

head(positive_tweets)



negative_tweets <- words_df[sentiment_value < 0] 

head(negative_tweets)


neutral_tweets <- words_df[sentiment_value == 0] 
head(neutral_tweets)


# Alternate way to classify as Positive, Negative or Neutral tweets

category_sentiments <- ifelse(sentiment_value < 0, "Negative", ifelse(sentiment_value > 0, "Positive", "Neutral"))

head(category_sentiments)  

category_sentiments2 <- cbind(text_df,category_sentiments)
head(category_sentiments2)
category_sentiments 


table(category_sentiments)
write.csv(category_sentiments, "category_sentimentsdemocrats_with_healthcareSyuzhet.csv")
category_sentiments

