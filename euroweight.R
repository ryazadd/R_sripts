library(ggplot2)
library(dplyr)
library(g.data)
library(sqldf)
euroweight_dat <- read_delim("R/data/euroweight_dat.txt", 
                             "\t", escape_double = FALSE, col_names = FALSE, 
                             trim_ws = TRUE)
names(euroweight_dat)[1] <- "ID"
names(euroweight_dat)[2] <- "Weight"
names(euroweight_dat)[3] <- "Batch"

batch1
batch1<-euroweight_dat[euroweight_dat$Batch == 1, ]
for (i in seq(1,8)){
  hist(euroweight_dat[euroweight_dat$Batch == i, ]$Weight
       ,main = paste("Hist of Batch #",toString(i)),
        col=rgb(148/255,211/255,172/255)
       ,xlab = "Weight", freq=FALSE)
  curve(dnorm(x,mean=mean(euroweight_dat[euroweight_dat$Batch == i, ]$Weight)
              ,sd=sd(euroweight_dat[euroweight_dat$Batch == i, ]$Weight))
        , add=TRUE,col="red")
}


hist(euroweight_dat$Weight
     ,main = paste("Hist of full data set")
     ,xlab = "Weight")
summary(euroweight_dat$Weight)
sd(euroweight_dat$Weight)
