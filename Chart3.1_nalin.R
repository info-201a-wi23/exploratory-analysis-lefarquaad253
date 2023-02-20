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
colors <- c("Apricot", "Bicolor", "Black", "Brindle", "Brown", "Golden", "Gray", "Harlequin","Merle (Blue)", "Merle (Red)","Red", "Sable", "Tricolor", "White", "Yellow")
count <- df_color$count
df1 <- data.frame(colors, count)

ggplot(df1)+
  geom_col(aes(x = reorder(colors, count), y = count, fill= colors))+
  labs(x = "Primary Color", y = "Count", title = "A Bar Chart showing the Distribution of Dogs by their Primary Color")


