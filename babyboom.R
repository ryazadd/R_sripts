library(mixtools)
library(ggplot2)
library(dplyr)
library(g.data)
library(sqldf)
library(hplot)

mydata = read.table("C:\\Users\\Daria_Riazanova\\Documents\\R\\data\\babyboom_dat.txt")

plot(mydata$V4,
     mydata$V3,
     xlab="Time",
     ylab="Weight",
     col="blue")
lines(mydata$V4,
      mydata$V3)

hist(mydata$V4)

t<-subset(x = mydata, V2 == 1, select = c(V2,V4))
hist(t$V2)
plot(t$V4, 
     t$v2)
hist(mydata$V2)
count_b=count(mydata$V2==1)
names(mydata)[1] <- "Time"
names(mydata)[2] <- "Sex"
names(mydata)[3] <- "Weight"
names(mydata)[4] <- "Minutes"

# Task1.1
# Сравниваем теоритическое биномиальное распределение сравниваем с выборкой
temp<-rbinom(44,1,0.5)

nrow(subset(mydata,Sex == "1"))
nrow(subset(mydata,Sex == "0"))

a=rbinom(44,1,0.5)
b=mydata$Sex
hist(a,xlab="Sex",xlim=c(0,1), col=rgb(1,0,0,0.5), main="Distribution of number boys and girs with binomial")
hist(b,add=T, col=rgb(0,0,1,0.5))

#Task1.2

# Task1.3
# a = rpois(n, lambda)
vec_min<-mydata$Minutes
hours<-rep(0, 24)
for (y in seq(1,24, by=1)){
   # print(y)
   for (i in vec_min){
      # print(i)
      if (i/(y*60)<=1){
         hours[y]=hours[y]+1
         vec_min = vec_min[vec_min!= i]
         # print(vec_min)
         
      }
       else{break}
   }
   # break
}
# Распределение Пуассона, lambda -  среднее число рождений в сутки
a_pois = rpois(44, 1.83)
hist(a_pois,main="Distribution births per hour for each hour " ,xlab="numbers kids per hour",xlim=c(0,4), col=rgb(248/255,180/255,0))
hist(hours, add=T, col=rgb(44/255,120/255,108/255) )

hist(hours
     ,main="Distribution births per hour for each hour" 
     ,xlab="numbers kids per hour"
     ,xlim=c(0,4)
     ,col=rgb(44/255,120/255,108/255)
     ,freq=FALSE)
curve(dpois(x, 1.83, log = FALSE),add=T, col="red")

# Task 1.4
vec_min<-mydata$Minutes
vec_diff<-rep(0, length(vec_min)-1)
for (i in seq(1, length(vec_min)-1)){
   vec_diff[i]=vec_min[i+1]-vec_min[i]
}
hist(vec_diff)

# Task1.5
t<-subset(x = mydata, Sex == 1, select = c(Weight))
t1<-subset(x = mydata, Sex == 0, select = c(Weight))
hist(t$Weight)  
hist(t1$Weight)

summary(t$Weight) 
summary(t1$Weight)
# summary(mydata)

