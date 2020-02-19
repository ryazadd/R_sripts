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

hist(airportdat$Scheduled_departures, col=rgb(225/255,244/255, 243/255)
     ,main = "Scheduled departments"
     ,xlab="Numbers of depsrtments")

hist(airportdat$Performed_departures, col=rgb(248/255,180/255,0)
     , main="Distrubition Performed_departures"
     ,xlab="Number of passangers")

hist(airportdat$Tons_freight, col="blue")
hist(airportdat$Tons_mail,add=T, col="red")

boxplot(airportdat$Tons_freight, main = "Tons_freight")
boxplot(airportdat$Performed_departures, main = "Performed_departures")

City_Pass<-sqldf("select City, SUM(Enplaned_passengers) as sum from airportdat group by City")
Max_city_Pas<-sqldf("select City from City_Pass order by sum desc limit 1")


City_Tones_freight<-sqldf("select City, SUM(Tons_freight) as sum from airportdat group by City")
Max_city_freight<-sqldf("select City from City_Tones_freight order by sum desc limit 1")

Max_city_freight

