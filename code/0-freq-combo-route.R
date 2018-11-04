library(dplyr)
library(car)
source("metro-bike-share-stations.csv")
source("pop_route.csv")

bikes <- read.csv("metro.csv", stringsAsFactors = FALSE)
# names(bikes)
all_stations <- select(bikes, Starting.Station.ID, Ending.Station.ID)
write.csv(all_stations, "all_stations.csv")
bike_table <- table(start = all_stations$Starting.Station.ID, end = all_stations$Ending.Station.ID)
bike_table <- as.data.frame(bike_table)
write.csv(bike_table, "bike_table.csv")


##### Most Frequent Combo Route #####
max_freq <- max(as.vector(bike_table$Freq), na.rm = FALSE)
max_tab <- select(data.frame(filter(bike_table, Freq == max_freq)), "start", "end")
max_start <- sapply(max_tab$start, as.character)
max_end <- sapply(max_tab$end, as.character)

station_data <- read.csv("data/metro-bike-share-stations.csv", stringsAsFactors = FALSE)
station_data <- as.data.frame(station_data)

max_start_station_name <- select(data.frame(filter(station_data, station_data$Station_ID == max_start)), "Station_Name")
max_end_station_name <- select(data.frame(filter(station_data, station_data$Station_ID == max_end)), "Station_Name")

max_start_station_string <- sapply(max_start_station_name, as.character)
max_end_station_string <- sapply(max_end_station_name, as.character)

print(paste0("The most frequent/popular stop and start station combination is the route from ", max_start_station_string, 
             " to ", max_end_station_string, " with a count of ", max_freq, " rides."))

pop_routes <- read.csv("pop_route.csv", stringsAsFactors = FALSE)