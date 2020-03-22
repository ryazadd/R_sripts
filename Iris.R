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
  print(i)
  print(lillie.test(iris_dat[iris_dat$iris_class == classes[i], ]$petal_length)
        ,alternative = c("two.sided", "less", "greater"))
  
}


for (i in seq(1,length(classes))){
  print(i)
  print(lillie.test(iris_dat[iris_dat$iris_class == classes[i], ]$sepal_length)
        ,alternative = c("two.sided", "less", "greater"))
  
}

wilcox.test(iris_dat[iris_dat$iris_class == classes[1], ]$sepal_length,
            iris_dat[iris_dat$iris_class == classes[2], ]$sepal_length,
            alternative = c("two.sided", "less", "greater")
            )


wilcox.test(iris_dat[iris_dat$iris_class == classes[1], ]$sepal_length,
            iris_dat[iris_dat$iris_class == classes[3], ]$sepal_length,
            alternative = c("two.sided", "less", "greater")
)


wilcox.test(iris_dat[iris_dat$iris_class == classes[2], ]$sepal_length,
            iris_dat[iris_dat$iris_class == classes[3], ]$sepal_length,
            alternative = c("two.sided", "less", "greater")
)

pairwise.t.test(iris_dat$sepal_length,iris_dat$iris_class,alternative = c("two.sided", "less", "greater"),var.equal = FALSE)
