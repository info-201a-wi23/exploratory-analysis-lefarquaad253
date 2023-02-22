#Map of the US showing amount of adoptable dogs in each state on September 20, 2019


#Load libraries
library("ggplot2")
library("maps")
library("dplyr")
library("plotly")
library("stringr")
library("tidyverse")

# Load data
allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)

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

blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank(), # remove border around plot
  )


# Join the `state_shape` and `allDogsDescriptions` dataframes as
# state_shape_data
state_shape_data <- left_join(state_shape, 
                                 adoption_data,
                                 by = c("region" = "state_fullname"))

# Make a choropleth map of amount of adoptable dogs by state
map <- ggplot(state_shape_data) +
  geom_polygon(mapping = aes(x = long, 
                             y = lat, 
                             group = group, 
                             fill = state_total)) +
  coord_map() +
  labs(title = 'Distribution of Adoptable Dogs in the United States on September 20, 2019', fill = 'Amount of Dogs') +
  blank_theme

# To make a blank theme, you can create custom theme like so, and then add it to the bottom of your ggplot
blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank(), # remove border around plot
  )
