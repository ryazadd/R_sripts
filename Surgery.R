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


surgery_dat<-na.omit(surgery)

names(surgery_dat)[1] <- "V_right_b"
names(surgery_dat)[2] <- "V_left_b"
names(surgery_dat)[3] <- "V_right_a"
names(surgery_dat)[4] <- "V_left_a"

hist(success)
success<- sum(surgery_dat$V_right_a-surgery_dat$V_right_b>0 & surgery_dat$V_left_a-surgery_dat$V_left_b>0)
binom.test(success
            , length(surgery_dat$V_right_a)
            , p = 0.7
            , alternative = "two.sided"
            , conf.level = 0.95)

binom.test(48
           , 100
           , p = 0.5
           , alternative = "two.sided"
           , conf.level = 0.95)

binom.test(8
           , 10
           , p = 0.5
           , alternative = "two.sided"
           , conf.level = 0.95)
