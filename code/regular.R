library(dplyr)
library(car)

bikes <- read.csv("metro.csv", stringsAsFactors = FALSE)
# print(unique(as.vector(bikes$Passholder.Type)))
# "Monthly Pass" "Flex Pass"    "Walk-up"
monthly_freq <- nrow(bikes %>% filter((Passholder.Type == 'Monthly Pass')))
flex_freq <- nrow(bikes %>% filter((Passholder.Type == 'Flex Pass')))
walk_up_freq <- nrow(bikes %>% filter((Passholder.Type == 'Walk-up')))
total <- monthly_freq + flex_freq + walk_up_freq

print(paste0("Out of a total of ", total, " riders, ", walk_up_freq, " bike riders include bike sharing as a regular part of their commute."))
# "Out of a total of 40462 riders, 11950 bike riders include bike sharing as a regular part of their commute."