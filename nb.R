library(caret)
library(e1071)


#split data into test train
data<-iris
dt<-sort(sample(nrow(data),nrow(data)*0.8))
train<-data[dt,]
test<-data[-dt,]
trainx<-subset(train, select = -Species)
trainy<- train$Species
testx<- subset(test, select = -Species)
testy<- test$Species


#Fit Naive Bayes model
nbFit<- naiveBayes(trainy ~ ., trainx)


#Predict from fit model
pred<-predict(nbFit,testx)


#show required parameters
xtab<-table(pred,testy)
print("Recall:")
sensitivity(xtab,"versicolor")
sensitivity(xtab,"setosa")
sensitivity(xtab,"virginica")

print("Precision:")
posPredValue(xtab,"versicolor")
posPredValue(xtab,"setosa")
posPredValue(xtab,"virginica")

#confusionMatrix(xtab)
confusionMatrix(xtab)$overall["Accuracy"]
table(pred,testy)

