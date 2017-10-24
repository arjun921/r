library(e1071)
data<-iris
dt<-sort(sample(nrow(data),nrow(data)*.8))
train<-data[dt,]
test<-data[-dt,]
trainx<-subset(train, select=-Species)
trainy<-train$Species
testx<-subset(test,select=-Species)
testy<-test$Species
nb_model<-naiveBayes(trainx,trainy)
pred<-predict(nb_model,testx)
xtab<-table(pred,testy)
library(caret)
confusionMatrix(xtab)
