#Bar Chart using dog data 
library("dplyr")
library("stringr")
library("ggplot2")
library("scales")

allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)
age_senior <- allDogDescriptions %>% 
  filter(str_detect(age, "Senior")) 
age_adult <- allDogDescriptions %>% 
  filter(str_detect(age, "Adult")) 
age_baby <- allDogDescriptions %>% 
  filter(str_detect(age, "Baby")) 
age_young <- allDogDescriptions %>% 
  filter(str_detect(age, "Young")) 

sum_baby <- nrow(age_baby)
sum_young <- nrow(age_young)
sum_adult <- nrow(age_adult)
sum_senior <- nrow(age_senior)

df_sum <- c(sum_baby, sum_young, sum_adult, sum_senior)
df_name <- c("Baby", "Young", "Adult", "Senior")
df <- cbind(df_name, df_sum)
df <- data.frame(df)
df <- df[order(df$df_sum),]

#ggplot(df, aes(x=df_name, y=df_sum)) + 
  #geom_bar(stat = "identity")

ggplot(df)+
  geom_col(aes(x = df_name, y = df_sum))
  #ylim(0, 30000)
  #scale_y_continuous(name="Number of Dogs", limits=c(0, 30000))
 
