data<-iris
dt<-sort(sample(nrow(data),nrow(data)*.8))
train<-data[dt,]
test<-data[-dt,]
