library(rpart)
#load data
data(iris)
#fit model
fit <- rpart(Species~.,data=iris)

#make predictions
predictions <- predict(fit, iris[,1:4], type="class")
#summarize accuracy
table(predictions, iris$Species)
plot(fit)
text(fit)