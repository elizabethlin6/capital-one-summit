##### Packages #####
# install.packages("plyr")
# install.packages("dplyr")
# install.packages("data.table")

##### Sources #####
library(dplyr)
library(car)
library(plyr)
library(data.table)
source("metro-bike-share-stations.csv")

##### End Station Output #####
my_data <- read.csv("data/metro-bike-share-trip-data.csv", stringsAsFactors = FALSE)
my_data <- my_data %>% select(Ending.Station.ID)
my_data <- as.data.frame(my_data)
my_data <- setDT(my_data)[, .N, by=Ending.Station.ID]
most_popular <- select(data.frame(filter(my_data, N == max(my_data$N))), "Ending.Station.ID")
mp_string <- sapply(most_popular, as.character)

station_data <- read.csv("data/metro-bike-share-stations.csv", stringsAsFactors = FALSE)
station_data <- as.data.frame(station_data)

station_name <- select(data.frame(filter(station_data, station_data$Station_ID == mp_string)), "Station_Name")
station_string <- sapply(station_name, as.character)

print(paste0("The most popular End stations is ", station_string))
# "The most popular End stations is 7th & Flower"

##### Start Station Output #####
my_data <- read.csv("data/metro-bike-share-trip-data.csv", stringsAsFactors = FALSE)
my_data <- my_data %>% select(Starting.Station.ID)
my_data <- as.data.frame(my_data)
my_data <- setDT(my_data)[, .N, by=Starting.Station.ID]
most_popular <- select(data.frame(filter(my_data, N == max(my_data$N))), "Starting.Station.ID")
mp_string <- sapply(most_popular, as.character)

station_data <- read.csv("data/metro-bike-share-stations.csv", stringsAsFactors = FALSE)
station_data <- as.data.frame(station_data)

station_name <- select(data.frame(filter(station_data, station_data$Station_ID == mp_string)), "Station_Name")
station_string <- sapply(station_name, as.character)

print(paste0("The most popular Start stations is ", station_string))
# "The most popular Start stations is Broadway & 3rd"