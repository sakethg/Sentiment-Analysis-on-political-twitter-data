#import data

work_dir<-"C:/Users/uia91182/Desktop/aba project/datasets"
getwd()
setwd(work_dir)
#install.packages("data.table",repos = "https://cran.r-project.org")


#Read Data

library(data.table)


data <- fread("republicans_with_jobs.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?") , stringsAsFactors = FALSE)
#View(data)
summary(data)


#install.packages("tidytext", repos = "https://cran.r-project.org")
#install.packages("dplyr", repos = "https://cran.r-project.org")


library(dplyr)
library(tidytext)

text_df <- data_frame(line = 1:1640, text = data$x)

head(text_df)


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

