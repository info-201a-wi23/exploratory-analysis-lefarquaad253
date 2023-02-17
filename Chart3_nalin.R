#Bar Chart using dog data 
library("dplyr")
library("stringr")
library("ggplot2")
library("scales")

allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)
df <- allDogDescriptions %>% 
  group_by(age) %>% 
  summarize(count = n())



df_sum <- c(sum_baby, sum_young, sum_adult, sum_senior)
df_name <- c("Baby", "Young", "Adult", "Senior")
df <- cbind(df_name, df_sum)
df <- data.frame(df)
df <- df[order(df$df_sum),]

#ggplot(df, aes(x=df_name, y=df_sum)) + 
  #geom_bar(stat = "identity")

ggplot(df)+
  geom_col(aes(x = age, y = count, fill= age))+
  reorder(x)
  #ylim(0, 30000)
  #scale_y_continuous(name="Number of Dogs", limits=c(0, 30000))
#add reorder function inside ggplot / put it around x variable (age)
#groupby and then summarize to get number of row (call it count), use na.rm=TRUE
 
