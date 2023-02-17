library("dplyr")
library("stringr")
library("ggplot2")
library("scales")

allDogDescriptions <- read.csv("allDogDescriptions.csv", stringsAsFactors = TRUE)
unique(allDogDescriptions$color_primary)

white_cream <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "White / Cream")) 
brown_chocolate <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Brown / Chocolate")) 
brindle <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Brindle")) 
black <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Black")) 
yellow <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Yellow / Tan / Blond / Fawn")) 
golden <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Golden")) 
apricot <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Apricot / Beige")) 
red <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Red / Chestnut / Orange")) 
bicolor <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Bicolor")) 
harlequin <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Harlequin")) 
gray <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Gray / Blue / Silver")) 
sable <- allDogDescriptions %>% 
  filter(str_detect(color_primary, "Sable")) 


sum_white <- nrow(white_cream)
sum_brown <- nrow(brown_chocolate)
sum_brindle <- nrow(brindle)
sum_black <- nrow(black)
sum_yellow <- nrow(yellow)
sum_golden <- nrow(golden)
sum_apricot <- nrow(apricot)
sum_red <- nrow(red)
sum_bicolor <- nrow(bicolor)
sum_harlequin <- nrow(harlequin)
sum_gray <- nrow(gray)
sum_sable <- nrow(sable)

df_sum <- c(sum_white, sum_brown, sum_brindle, sum_black, sum_yellow, sum_golden, sum_apricot, sum_red, sum_bicolor, sum_harlequin, sum_gray, sum_sable)
df_name <- c("White", "Brown", "Brindle", "Black","Yellow", "Golden", "Apricot", "Red", "Bicolor", "Harlequin", "Gray", "Sable")
df <- cbind(df_name, df_sum)
df <- data.frame(df)

graph3 <- ggplot(df)+
  geom_col(aes(x = df_name, y = df_sum))+
  
