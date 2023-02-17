# Pie chart of the ages of adoptable dogs from the dataset 

# Load libraries 
install.packages("RColorBrewer")
library("RColorBrewer")
library("ggplot2")
library("maps")
library("stringr")
library("dplyr")
library(readr)

# Load the data 
allDogDescriptions <- read.csv("exploratory-analysis-lefarquaad253/allDogDescriptions.csv", stringsAsFactors = FALSE)
View(allDogDescriptions)

# Sum of ages 
sum_age <- allDogDescriptions %>% 
  group_by(age) %>% 
  summarize(count = n())

# Vector of ages and label
age <- c(27955, 9397, 4634, 16194)
label <- c("Adult", "Baby", "Senior", "Young")

# Create pie chart 
pie(age, label, main = "Age of Adopted Dogs", col = c("darksalmon", "cadetblue3", "darkseagreen2", "burlywood"))
