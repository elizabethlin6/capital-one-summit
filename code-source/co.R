library(dplyr)
library(car)

bikes <- read.csv("metro.csv", stringsAsFactors = FALSE)
names(bikes)
all_stations <- select(bikes, Starting.Station.ID, Ending.Station.ID)
# dir.create(file.path("/Users/elizabethlin/desktop/co", "output"))
write.csv(all_stations, "all_stations.csv")
bike_table <- table(start = all_stations$Starting.Station.ID, end = all_stations$Ending.Station.ID)

start <- mutate(all_stations, start_num = length(unique(all_stations$Start.Station.ID)))
end <- mutate(all_stations, end_num = length(unique(all_stations$End.Station.ID)))



round_trip_num <- nrow(bikes %>% filter((Trip.Route.Category == "Round Trip")))
one_way_num <- nrow(bikes %>% filter((Trip.Route.Category == "One Way")))
compare_vector <- c(round_trip_num, one_way_num)
pie(compare_vector, col=c("#ff91d9", "#90fcff"), labels=c("Round Trip", "One Way"), main = "Distribution of Trip Routes") 


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
combo_bp <- barplot(my_combos, main = paste0("Breakdown of Trip Route Category-Passholder Type Combinations"), horiz=TRUE, 
        names.arg=c("RT-MP", "OW-MP","RT-FP", "OW-FP", "RT-WU", "OW-WU"),
        col=c("#30bf10", "#ce0404", "#30bf10", "#ce0404","#30bf10", "#ce0404"),
        xlab = "Number of Bikers",
        ylab = "Trip Combo", 
        legend("topright", 
       legend = c("Round Trip", "One Way"), 
       fill = c("#30bf10", "#ce0404")))




