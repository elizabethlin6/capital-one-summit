library(dplyr)
library(car)

bikes <- read.csv("metro.csv", stringsAsFactors = FALSE)

get_trip <- function(pass) {
  combo_num <- nrow(bikes %>% filter((Passholder.Type == pass )))
}

monthly <- get_trip("Monthly Pass")
flex <- get_trip("Flex Pass")



my_combos <- c(monthly, flex)
barplot(my_combos, main = paste0("Breakdown of Passholder Type of all Riders"), horiz=FALSE, 
        names.arg=c("Monthly Pass", "Flex Pass"),
        col=c("yellow", "purple"),
        xlab = "Passholder Type",
        ylab = "Number of Riders")
legend("topright", legend = c("RT = Round Trip", "OW = One Way", "MP = Montly Pass", "FP = Flex Pass", "WU = Walk-up"), col = c("#30bf10", "#ce0404", "white", "white", "white"), lwd=10)


