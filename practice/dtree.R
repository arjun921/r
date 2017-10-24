data<-iris
dt<-sort(sample(nrow(data),nrow(data)*.8))
train<-data[dt,]
test<-data[-dt,]
trainx<-subset(train, select = -Species)
trainy<-train$Species
testx<-subset(test, select= -Species)
testy<- test$Species
library(rpart)
dt_model<- rpart(trainy ~ ., trainx)
pred<-predict(dt_model,testx,type = "class")
xtab<-table(pred,testy)
library(caret)
confusionMatrix(xtab)
