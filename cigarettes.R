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
cigarettes_dat<- read.delim("C:\\Users\\Daria_Riazanova\\Documents\\R\\data\\cigarettes_dat.txt", 
                       ";",header = FALSE)

names(cigarettes_dat)[1] <- "brand"
names(cigarettes_dat)[2] <- "tar"
names(cigarettes_dat)[3] <- "nicotine"
names(cigarettes_dat)[4] <- "weight"
names(cigarettes_dat)[5] <- "carbon_monoxide"

hist(cigarettes_dat$carbon_monoxide)
lillie.test(cigarettes_dat$carbon_monoxide)

cor.test(cigarettes_dat$weight, cigarettes_dat$nicotine, method = "spearman")
cor.test(cigarettes_dat$weight, cigarettes_dat$nicotine, method = "kendall")



kendall