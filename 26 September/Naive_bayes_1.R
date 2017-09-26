library(class)
library(e1071)
data(iris)
iris$Species=factor(iris$Species)
str(iris)
table(iris$Species)
sample_iris=sample(150,110,replace=FALSE)
sample_iris
iris_training=iris[sample_iris,]
iris_test=iris[-sample_iris,]
iris_test
iris_training_labels=iris
iris_classifier=naiveBayes(iris_training,iris_training_labels)
iris_classifier

iris_test_pred=predict(iris_classifier.iris_test)
iris_test_pred