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
library(readxl)
library(car)
library(lmtest)
library("car")
library(MASS)
library(hrbrthemes)
library(nlme)
library(jtools)
library(ggiraphExtra)

mlr02 <- read_excel("~/R/data/mlr02.xlsx")


fit <-lm(X1~X2+X3, data = mlr02)
summary(fit)

new_dat<-predict(fit)

plot(mlr02$X1, pch = 16, col = "blue") #Plot the results
plot(fit$residuals)

bptest(fit)
durbinWatsonTest(fit)
 

# Fit the full model
full.model<-lm(X1~X2+X3, data = mlr02)
# Stepwise regression model
step.model<-stepAIC(full.model, direction = "both",
                       trace = FALSE)
summary(step.model)
predict(results)
plot(mlr02$X1,type="l", main = "Y")
plot(predict(results),type="l", main="Predict")

model_predic<-c(mlr02$X1,predict(fit))
mlr02$predlm = predict(fit)
plot(model_predic,type="l", main="Predict" )

theme_set(theme_bw())

ggplot(mlr02, aes(x = X2+X3, y = X1) ) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color="red",alpha = .05)

ggplot(mlr02, aes(x = X2+X3, y = X1)) +
  geom_smooth(formula=y~x1+x2,method = "lm", se = FALSE,alpha = .05, col=rgb(255/255,182/255,119/255))+
  geom_point(size=3) 
  # geom_line(aes(y = predlm), size = 1, col=rgb(95/255, 108/255, 175/255))


ggPredict(fit,se=TRUE,interactive=TRUE)

plot_summs(fit)

cigarettes_dat<- read.delim("C:\\Users\\Daria_Riazanova\\Documents\\R\\data\\cigarettes_dat.txt", 
                            ";",header = FALSE)

fit <-lm(carbon_monoxide~tar+nicotine+weight, data = cigarettes_dat)
summary(fit)
ggPredict(fit,se=TRUE,interactive=TRUE)

ggplot(cigarettes_dat, aes(x = tar+nicotine+weight, y = carbon_monoxide) ) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color="red",alpha = .05)
