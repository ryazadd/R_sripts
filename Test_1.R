library(mixtools)
library(ggplot2)
library(dplyr)
# Test Defintion for function
PrintInputVal<- function(InputStr){
  print(InputStr)
}


tmp = PrintInputVal(4)

# ls.str() -- objects in memory
# seq - series from A to B
seq_1 = seq(20,50)
mean_1 = mean(seq(20,60))
sum_1 = sum(seq(51,91))
print(sum_1)
# random values T- with replacement
v_1 = sample(-50:50, 10, replace=T)

Feb<-function(i){
  tmp = case_when(
         i == 0 ~ 0,
         i == 1 ~ 1,
         TRUE ~ print('test')
  )
  return(tmp)
}