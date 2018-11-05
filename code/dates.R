library(dplyr)
library(car)

bikes <- read.csv("metro.csv", stringsAsFactors = FALSE)
bikes <- select(bikes, Start.Time, End.Time)


bikes <- mutate(bikes, onbike_duration = bikes$Start.Time - bikes$End.Time)
end <- mutate(all_stations, end_num = length(unique(all_stations$End.Station.ID)))

round_trip_num <- nrow(bikes %>% filter((Trip.Route.Category == "Round Trip")))
one_way_num <- nrow(bikes %>% filter((Trip.Route.Category == "One Way")))
compare_vector <- c(round_trip_num, one_way_num)
pie(compare_vector, col=c("#ff91d9", "#90fcff"), labels=c("Round Trip", "One Way"), main = "Distribution of Trip Routes") 