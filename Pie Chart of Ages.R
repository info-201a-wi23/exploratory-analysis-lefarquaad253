# Pie chart of the ages of adoptable dogs from the dataset 

# Load libraries 
#library("RColorBrewer")
library("ggplot2")
library("maps")
library("stringr")
library("dplyr")
#library("readr")

# Load the data 
allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)
View(allDogDescriptions)

# Sum of ages 
sum_age <- allDogDescriptions %>% 
  group_by(age) %>% 
  summarize(count = n())

# Vector of ages and label
age <- c(27955, 9397, 4634, 16194)
label <- c("Adult", "Baby", "Senior", "Young")

# Create pie chart 
piechart <- pie(age, label, main = "Age of Dogs in Shelter", col = c("red", "blue", "green", "yellow"))
