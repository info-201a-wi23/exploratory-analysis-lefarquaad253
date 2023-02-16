#Bar Chart using dog data 
library("dplyr")
library("stringr")
library("ggplot2")

allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)
age_senior <- allDogDescriptions %>% 
  filter(str_detect(age, "Senior")) 
age_adult <- allDogDescriptions %>% 
  filter(str_detect(age, "Adult")) 
age_baby <- allDogDescriptions %>% 
  filter(str_detect(age, "Baby")) 
age_young <- allDogDescriptions %>% 
  filter(str_detect(age, "Young")) 

df_sum <- c(nrow(age_baby), nrow(age_young), nrow(age_adult), nrow(age_senior))
df_name <- c("Baby", "Young", "Adult", "Senior")
df <- cbind(df_name, df_sum)
df <- data.frame(df)

ggplot(df, aes(x=df_name, y=df_sum)) + 
  geom_bar(stat = "identity")
