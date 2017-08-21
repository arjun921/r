rm(list=ls())
library(ISLR)
carseats<-Carseats
attach(Carseats)
#creating Label for conditio if Sales is above 8
High=ifelse(Sales<=8,"No","Yes")
Carseats=data.frame(Carseats,High)
train=sample(1:nrow(Carseats),200)
Carseats.test=Carseats[-train,]
High.test=High[-train]
tree.carseats=tree(High~,)