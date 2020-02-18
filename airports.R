library(mixtools)
library(ggplot2)
library(dplyr)
library(g.data)
library(sqldf)

airportdat <- read_delim("R/data/airportdat.txt", 
                              ";", escape_double = FALSE, col_names = FALSE, 
                              trim_ws = TRUE)
names(airportdat)[1] <- "Airport"
names(airportdat)[2] <- "City"
names(airportdat)[3] <- "Scheduled_departures"
names(airportdat)[4] <- "Performed_departures"
names(airportdat)[5] <- "Enplaned_passengers"
names(airportdat)[6] <- "Tons_freight"
names(airportdat)[7] <- "Tons_mail"

hist(airportdat$Scheduled_departures, col="red")
hist(airportdat$Performed_departures,add=T)

hist(airportdat$Tons_freight, col="blue")
hist(airportdat$Tons_mail,add=T, col="red")

boxplot(airportdat$Tons_freight)
