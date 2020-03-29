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
iris_dat <- read.delim("C:\\Users\\Daria_Riazanova\\Documents\\R\\data\\iris_dat.txt", 
                             ",",header = FALSE)
names(iris_dat)[1] <- "sepal_length"
names(iris_dat)[2] <- "sepal_width"
names(iris_dat)[3] <- "petal_length"
names(iris_dat)[4] <- "petal_width"
names(iris_dat)[5] <- "iris_class"


# выделить три класса
df2 <- as.vector(iris_dat$iris_clas)
classes=unique(df2)

for (i in seq(1,length(classes))){
  print(classes[i])
  print(lillie.test(iris_dat[iris_dat$iris_class == classes[i], ]$petal_length)
        ,alternative = "two.sided")
  print(lillie.test(iris_dat[iris_dat$iris_class == classes[i], ]$sepal_length)
        ,alternative = "two.sided")
  
}


for (i in seq(1,length(classes)-1)){
  print(i)
  print(wilcox.test(iris_dat[iris_dat$iris_class == classes[i], ]$petal_width,
              iris_dat[iris_dat$iris_class == classes[i+1], ]$petal_width,
              alternative = "two.sided"))
  
}


          


wilcox.test(iris_dat[iris_dat$iris_class == classes[1], ]$sepal_length,
            iris_dat[iris_dat$iris_class == classes[3], ]$sepal_length,
            alternative = "two.sided")



wilcox.test(iris_dat[iris_dat$iris_class == classes[2], ]$sepal_length,
            iris_dat[iris_dat$iris_class == classes[3], ]$sepal_length,
            alternative = "two.sided")

iris_types<-factor(iris_dat$iris_class)
pt<-pairwise.t.test(iris_dat$petal_width
                ,iris_types
                ,alternative = "two.sided"
                ,p.adjust.method = "none")

bartlett.test(iris_dat$sepal_length
              ,iris_types
              ,alternative = "two.sided"
              ,paired=TRUE
              )

cor.test(iris_dat$sepal_length,iris_dat$sepal_width, method = "spearman")
cor.test(iris_dat$sepal_length,iris_dat$sepal_width, method = "kendall")

cor.test(iris_dat$petal_length,iris_dat$petal_width, method = "spearman")
cor.test(iris_dat$petal_length,iris_dat$petal_width, method = "kendall")



