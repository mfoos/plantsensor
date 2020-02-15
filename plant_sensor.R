library(readr)
library(ggplot2)
library(lubridate)
library(dplyr)

recs <- read_delim("~/Documents/Projects/raspberrypi/log.txt", col_names = FALSE, delim = " ") %>%
  select("temp" = X2, "moisture" = "X4")

recs$time <- seq_len(nrow(recs))

ggplot(recs, aes(x = time, y = moisture)) +
  geom_path()

####

recs <- read_delim("~/Documents/Projects/raspberrypi/log2.txt", col_names = FALSE, delim = " ") %>%
  select("date" = X1, "time" = X2, "temp" = X4, "moisture" = X6)

ggplot(recs, aes(x = time, y = temp)) +
  geom_path() + 
  facet_grid(rows = vars(date))

recs2 <- recs %>% filter(temp < 100)

ggplot(recs2, aes(x = time, y = temp)) +
  geom_path() + 
  facet_grid(rows = vars(date))

while (TRUE){
  recs <- read_delim("~/Documents/Projects/raspberrypi/log2.txt", col_names = FALSE, delim = " ") %>%
    select("date" = X1, "time" = X2, "temp" = X4, "moisture" = X6)
  
  recs3 <- recs %>% 
    #filter(moisture < 950) %>%
    mutate(moisture = if_else(moisture > 900, 0, moisture)) %>%
    mutate(moisture = na_if(moisture, 0))
  
  print(recs3 %>% 
  ggplot(aes(x = time, y = moisture)) +
    ggtitle(paste0("Run at ", format(Sys.time(), "%H:%M"))) +
    geom_point() + 
    facet_grid(rows = vars(date)))
    
  print("sleep")
  Sys.sleep(90)
}
# don't forget to add 5 hours
