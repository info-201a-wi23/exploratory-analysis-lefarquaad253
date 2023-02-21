
library(dplyr)
rm(list = ls())
df <- read.csv("~/Info201code/exploratory-analysis-lefarquaad253/allDogDescriptions.csv")

df$sex <- toupper(df$sex)
df$sex[grep("\\bM\\b", df$sex)] <- 'MALE'
df$sex[grep("\\bF\\b", df$sex)] <- 'FEMALE'

keep_sex <- c("MALE", "FEMALE")
df <- df[df$sex %in% keep_sex, ]

df <-
  df %>%
  group_by(contact_state) %>%
  filter(contact_state == "Washington") %>%
  subset(select = c(age, sex, contact_state))

mostCommon <- 
  df %>%
  count(contact_state, sort = TRUE)

keep_state <- as.vector(unlist(mostCommon$contact_state))[1:10]

df <- df[df$contact_state %in% keep_state, ]