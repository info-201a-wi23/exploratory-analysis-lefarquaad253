
survey <- read.csv("~/Info201code/exploratory-analysis-lefarquaad253/allDogDescriptions.csv", stringsAsFactors = FALSE)
View(survey)

summary(survey)

most_common_age <- max(survey$age)
most_common_age

most_common_size <- max(survey$size)
most_common_size

most_common_color<- max(survey$color_primary, na.rm = TRUE)
most_common_color

most_common_breed <- max(survey$breed_primary)
most_common_breed

state_most_adopted <- max(survey$contact_state)
state_most_adopted
