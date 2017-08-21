#SVR
#Arjun S
#MSMI1603
data=read.csv("Working_Directory/r/SVR/svm.csv",header=T)
head(data)
plot(data)
#install packages
install.packages("e1071")
library(e1071)
plot(data)
modelsvm = svm(Y~X,data)
predYsvm = predict(modelsvm,data)
points(data$X, predYsvm,col="red",pch=16)

#Calculate paramters
W = t(modelsvm$coefs) %*% modelsvm$SV
b = modelsvm$rho
install.packages("hydroGOF")
library(hydroGOF)
RMSEsvm = rmse(predYsvm,data$Y)
OptModelsvm=tune(svm, Y~X, data=data,ranges=list(elsilon=seq(0,1,0.1), cost=1:100))
print(OptModelsvm)
plot(OptModelsvm)
BstModel=OptModelsvm$best.model
PredYBst=predict(BstModel,data)
RMSEBst=rmse(PredYBst,data$Y)
W = t(BstModel$coefs) %*% BstModel$SV
b = BstModel$rho
plot(data, pch=16)
points(data$X, predYsvm, col = "blue", pch=10)
points(data$X, PredYBst, col = "red", pch=10)
points(data$X, predYsvm, col = "blue", type="l")
points(data$X, PredYBst, col = "red",  type="l")

