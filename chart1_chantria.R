#Map of the US showing amount of dogs adopted


#Load libraries
library("ggplot2")
library("maps")
library("stringr")
library("dplyr")

# Load data
allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)

# Load state shapefile
state_shape <- map_data("state")

#Map every state
ggplot(data = state_shape) +
  #Map each state as a group
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group))
          
  coord_map()