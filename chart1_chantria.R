#Map of the US showing amount of adoptable dogs in each state


#Load libraries
library("ggplot2")
library("maps")
library("dplyr")
library("plotly")
library("stringr")
library("tidyverse")

# Load data
allDogDescriptions <- read.csv("C:/Users/ryuta/Desktop/INFO 201 Directory/exploratory-analysis-lefarquaad253/allDogDescriptions.csv", stringsAsFactors = TRUE)


# Load state shapefile
state_shape <- map_data("state")
View(state_shape)

# Add full (lowercased) state name to allDogDescriptions, matching on state abbreviation
allDogDescriptions <- allDogDescriptions %>% 
  mutate(state_fullname =
           tolower(state.name[match(contact_state, state.abb)]))

# Make a new dataframe of the total adoptable dogs for each state (by full name)
adoption_data <- allDogDescriptions %>%  
  group_by(state_fullname) %>% 
  summarize(state_total = n()) %>%
  drop_na(state_fullname)


# Join the `state_shape` and `allDogsDescriptions` dataframes as
# state_shape_data
state_shape_data <- left_join(state_shape, 
                                 adoption_data,
                                 by = c("region" = "state_fullname"))

# Make a choropleth map of amount of adoptable dogs by state
ggplot(state_shape_data) +
  geom_polygon(mapping = aes(x = long, 
                             y = lat, 
                             group = group, 
                             fill = state_total)) +
  coord_map() +
  labs(title = 'Amount of Adoptable Dogs in Each State', fill = 'Amount')




