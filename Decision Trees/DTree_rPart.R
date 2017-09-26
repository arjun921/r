library(rpart)
library(rpart.plot)
data(iris)
str(iris)
table(iris$Species)
head(iris)
set.seed(9850)
g<-runif(nrow(iris))
irisr<-iris[order(g),]
head(irisr)
iris
m3 <-rpart(Species~., data=irisr[1:100,],method="class")
m3
rpart.plot(m3)
?rpart.plot
rpart.plot(m3,type=3,extra=101,fallen.leaves = T)
summary(m3)
p3<-predict(m3,irisr[101:150,],type="class")
table(irisr[101:150,5],predicted=p3)
