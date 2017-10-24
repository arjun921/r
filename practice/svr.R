data=read.csv("svm.csv", header = T)
head(data)
dt = sort(sample(nrow(data),nrow(data)*.8))
train = data[dt,]
test = data[-dt,]
plot(train)
library(e1071)
fit<-svm(train$Y,train$X)

pred<-predict(fit,test$Y)
points(test$X,pred,col="blue",pch=2,type="l")
points(train$X,train$Y,col="red",pch=1,type="l")
xtab<-table(pred,test$Y)
library(caret)
confusionMatrix(xtab)
