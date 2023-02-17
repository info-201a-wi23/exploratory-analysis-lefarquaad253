library("dplyr")
library("stringr")
library("ggplot2")
library("scales")

allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)
unique(allDogDescriptions$color_primary)

df_color <- allDogDescriptions %>% 
  group_by(color_primary) %>% 
  summarize(count = n())

df_color <-df_color[-16,]

ggplot(df_color)+
  geom_col(aes(x = reorder(color_primary, count), y = count, fill= color_primary))
