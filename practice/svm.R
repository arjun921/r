data<-iris
dt<-sort(sample(nrow(data),nrow(data)*0.8))
train<-data[dt,]
test<-data[-dt,]
trainx<-subset(train, select=-Species)
trainy<-train$Species
testx<-subset(test, select=-Species)
testy<-test$Species
library(e1071)
library(caret)
svm_model<-svm(trainy ~ ., trainx)
pred<- predict(svm_model, testx)
xtab<-table(pred,testy)
confusionMatrix(xtab)
















install.packages("e1071")
install.packages("caret")
library(e1071)
trainx<-subset(train, select = -Species)
trainy<-train$Species
testx<-subset(test, select = -Species)
testy<-test$Species
svm_model<-svm(trainy ~ .,data=trainx)
pred<-predict(svm_model,testx)

library(caret)
xtab<-table(pred,testy)
confusionMatrix(xtab)
