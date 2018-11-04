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