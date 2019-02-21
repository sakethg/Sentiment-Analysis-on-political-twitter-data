#  Install Requried Packages
installed.packages("SnowballC")
installed.packages("tm")
installed.packages("twitteR")
installed.packages("syuzhet")

# Load Requried Packages
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")



library(data.table)
data_republicans <- fread("C:/Users/uia91182/Desktop/aba project/datasets/republicans_tweets (1).csv", sep=",", header=T,
                        strip.white = T, na.strings = c("NA","NaN","","?")) 


# install.packages("tidytext", repos = "https://cran.r-project.org")
# install.packages("dplyr", repos = "https://cran.r-project.org")
library(dplyr)
library(tidytext)
text_df <- data_frame(line = 1:38415, text = data_republicans$Content)
head(text_df)

#removing hashtag , urls and other special charactersR

tweets.df2 <- gsub("http.*","",text_df)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)

head(tweets.df2)




text = data_republicans$Content
text_df %>%
  unnest_tokens(word, text) # This means that in data frame text_df, tokenize column "text" by each
republicans_with_hcr <-text[grep(pattern = "hcr", text, ignore.case = T)]
getwd()
write.csv(republicans_with_hcr, "republicans_with_hcr.csv")
republicans_with_hcrjobs <-republicans_with_hcr[grep(pattern = "jobs", text, ignore.case = T)]
write.csv(republicans_with_hcrjobs, "republicans_with_hcrjobs.csv")

republicans_with_obama<-text[grep(pattern = "Obama", text, ignore.case = T)]
write.csv(republicans_with_obama, "republicans_with_obama.csv")
republicans_with_obamacare <-republicans_with_obama[grep(pattern = "care", text, ignore.case = T)]
write.csv(republicans_with_obamacare , "republicans_with_obamacare.csv")

republicans_with_energy <-text[grep(pattern = "energy", text, ignore.case = T)]
write.csv(republicans_with_energy, "republicans_with_energy.csv")
republicans_with_energytax <-republicans_with_energy[grep(pattern = "tax", text, ignore.case = T)]
write.csv(republicans_with_energytax , "republicans_with_energytax.csv")

republicans_with_house <-text[grep(pattern = "house", text, ignore.case = T)]
write.csv(republicans_with_house, "republicans_with_house.csv")
republicans_with_energyhouse <-republicans_with_house[grep(pattern = "energy", text, ignore.case = T)]
write.csv(republicans_with_energyhouse , "republicans_with_energyhouse.csv")
republicans_with_energyhousecommerce <-republicans_with_energyhouse[grep(pattern = "commerce", text, ignore.case = T)]
write.csv(republicans_with_energyhousecommerce , "republicans_with_energyhousecommerce.csv")
republicans_with_energyhousecommercecommittee <-republicans_with_energyhousecommerce[grep(pattern = "committee", text, ignore.case = T)]
write.csv(republicans_with_energyhousecommercecommittee , "republicans_with_energyhousecommercecommittee.csv")



