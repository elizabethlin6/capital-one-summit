library(dplyr)
library(car)

bikes <- read.csv("metro.csv", stringsAsFactors = FALSE)

get_trip <- function(pass) {
  combo_num <- nrow(bikes %>% filter((Passholder.Type == pass)))
}

monthly <- get_trip("Monthly Pass")
flex <- get_trip("Flex Pass")
walk_up <- get_trip("Walk-up")
my_combos <- c(monthly, flex, walk_up)
barplot(my_combos, main = paste0("Breakdown of Passholder Type of all Riders"), horiz=FALSE, 
        names.arg=c("Monthly Pass", "Flex Pass", "Walk-up"),
        col=c("yellow", "purple", "blue"),
        xlab = "Passholder Type",
        ylab = "Number of Riders")


