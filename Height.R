library(reshape)
library(mixtools)
library(ggplot2)
library(dplyr)
library(g.data)
library(sqldf)
library(hplot)
library(MVN)
library(nortest)
library(exptest)
library(vcd)



lillie.test(vec_BasketballPlayers$HtBk)
shapiro.test(vec_BasketballPlayers$HtBk)
hist(vec_BasketballPlayers$HtBk
     ,main = "Hist of Basketball Players height",
     col=rgb(148/255,211/255,172/255)
     ,xlab = "Weight", freq=FALSE)
curve(dnorm(x,mean=mean(vec_BasketballPlayers$HtBk)
            ,sd=sd(vec_BasketballPlayers$HtBk))
      , add=TRUE,col="red")


shapiro.test(vec_FootballPlayers$HtFt)
lillie.test(vec_FootballPlayers$HtFt)
hist(vec_FootballPlayers$HtFt
     ,main = "Hist of Football Players height",
     col=rgb(148/255,211/255,172/255)
     ,xlab = "Weight", freq=FALSE)
curve(dnorm(x,mean=mean(vec_FootballPlayers$HtFt)
            ,sd=sd(vec_FootballPlayers$HtFt))
      , add=TRUE,col="red")

hist(vec_BasketballPlayers$HtBk)
hist(vec_FootballPlayers$HtFt)

vec_BasketballPlayers<-sqldf("SELECT HtBk from height where HtBk is not null")
vec_FootballPlayers<-sqldf("SELECT HtFt from height where HtBk is not null")


t.test(vec_BasketballPlayers$HtBk
       ,vec_FootballPlayers$HtFt
       ,alternative = "two.sided",
       , exact = NULL)      


var.test(vec_BasketballPlayers$HtBk,vec_FootballPlayers$HtFt
         ,alternative = "two.sided"
         , exact = NULL)



wilcox.test(vec_BasketballPlayers[order(vec_BasketballPlayers$HtBk),],
            vec_FootballPlayers[order(vec_FootballPlayers$HtFt),] ,alternative = "two.sided", exact = FALSE
)
