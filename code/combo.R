library(dplyr)
library(car)

bikes <- read.csv("metro.csv", stringsAsFactors = FALSE)
# print(unique(as.vector(bikes$Trip.Route.Category)))
# "Round Trip" "One Way" 
# print(unique(as.vector(bikes$Passholder.Type)))
# "Monthly Pass" "Flex Pass"    "Walk-up"

# Combinations Types:
# - Round Trip, Monthly Pass
# - Round Trip, Flex Pass
# - Round Trip, Walk-up
# - One Way, Monthly Pass
# - One Way, Flex Pass
# - One Way, Walk-up

get_combos <- function(trip, pass) {
  combo_num <- nrow(bikes %>% filter((Trip.Route.Category == trip & Passholder.Type == pass )))
}

r_mp <- get_combos("Round Trip", "Monthly Pass")
r_fp <- get_combos("Round Trip", "Flex Pass")
r_wu <- get_combos("Round Trip", "Walk-up")
o_mp <- get_combos("One Way", "Monthly Pass")
o_fp <- get_combos("One Way", "Flex Pass")
o_wu <- get_combos("One Way", "Walk-up")


my_combos <- c(r_mp, r_fp, r_wu, o_mp, o_fp, o_wu)
barplot(my_combos, main = paste0("Breakdown of Trip Route Category-Passholder Type Combinations"), horiz=TRUE, 
                    names.arg=c("RT-MP", "OW-MP","RT-FP", "OW-FP", "RT-WU", "OW-WU"),
                    col=c("#30bf10", "#ce0404", "#30bf10", "#ce0404","#30bf10", "#ce0404"),
                    xlab = "Number of Riders",
                    ylab = "Trip Combination")
legend("topright", legend = c("RT = Round Trip", "OW = One Way", "MP = Montly Pass", "FP = Flex Pass", "WU = Walk-up"), col = c("#30bf10", "#ce0404", "white", "white", "white"), lwd=10)


