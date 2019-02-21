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
data_democrats <- fread("C:/Users/uia91182/Desktop/aba project/datasets/democrats_tweets (1).csv", sep=",", header=T,
                        strip.white = T, na.strings = c("NA","NaN","","?")) 


# install.packages("tidytext", repos = "https://cran.r-project.org")
# install.packages("dplyr", repos = "https://cran.r-project.org")
library(dplyr)
library(tidytext)
text_df <- data_frame(line = 1:19321, text = data_democrats$Content)
head(text_df)

#removing hashtag , urls and other special charactersR

tweets.df2 <- gsub("http.*","",text_df)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)

head(tweets.df2)




text = data_democrats$Content
text_df %>%
  unnest_tokens(word, text) # This means that in data frame text_df, tokenize column "text" by each
#word (standard tokenization).

democrats_with_hcr <-text[grep(pattern = "hcr", text, ignore.case = T)]
getwd()
write.csv(democrats_with_hcr, "democrats_with_hcr.csv")
democrats_with_hcrjobs <-democrats_with_hcr[grep(pattern = "jobs", text, ignore.case = T)]
write.csv(democrats_with_hcrjobs, "democrats_with_hcrjobs.csv")

democrats_with_obama<-text[grep(pattern = "Obama", text, ignore.case = T)]
write.csv(democrats_with_obama, "democrats_with_obama.csv")
democrats_with_obamacare <-democrats_with_obama[grep(pattern = "care", text, ignore.case = T)]
write.csv(democrats_with_obamacare , "democrats_with_obamacare.csv")

democrats_with_energy <-text[grep(pattern = "energy", text, ignore.case = T)]
write.csv(democrats_with_energy, "democrats_with_energy.csv")
democrats_with_energytax <-democrats_with_energy[grep(pattern = "tax", text, ignore.case = T)]
write.csv(democrats_with_energytax , "democrats_with_energytax.csv")

democrats_with_energy <-text[grep(pattern = "energy", text, ignore.case = T)]
write.csv(democrats_with_energy, "democrats_with_energy.csv")
democrats_with_energyhouse <-democrats_with_energy[grep(pattern = "house", text, ignore.case = T)]
write.csv(democrats_with_energyhouse , "democrats_with_energyhouse.csv")
democrats_with_energyhousecommerce <-democrats_with_energyhouse[grep(pattern = "commerce", text, ignore.case = T)]
write.csv(democrats_with_energyhousecommerce , "democrats_with_energyhousecommerce.csv")
democrats_with_energyhousecommercecommittee <-democrats_with_energyhousecommerce[grep(pattern = "committee", text, ignore.case = T)]
write.csv(democrats_with_energyhousecommercecommittee , "democrats_with_energyhousecommercecommittee.csv")


#data with Health care bill
#democrats_with_healthcarebill <-democrats_with_healthcare[grep(pattern = "bill", democrats_with_healthcare, ignore.case = T)]
#write.csv(democrats_with_healthcarebill, "democrats_with_healthcarebill.csv")



#democrats_with_vote <-text[grep(pattern = "vote", text, ignore.case = T)]
#write.csv(democrats_with_vote, "democrats_with_vote.csv")





#democrats_with_tax <-text[grep(pattern = "tax", text, ignore.case = T)]
#write.csv(democrats_with_tax, "democrats_with_tax.csv")


#democrats_with_jobs <-text[grep(pattern = "jobs", text, ignore.case = T)]
#write.csv(democrats_with_jobs, "democrats_with_jobs.csv")


