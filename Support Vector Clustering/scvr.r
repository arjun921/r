library("svcR")
require("svcR")
data("iris")
q<-40
retB <- findModelCluster(MetOpt = 1, MetLab = 1, Nu=0.55, q=40, K=1, G=15, Cx=0, Cy=0, DName = "iris")
