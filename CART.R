
#reading Libraries
rm(list=ls())
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)
library(readxl)


#reading data
data=read.csv("C:/Users/SAHIL MODY/OneDrive/Desktop/DATA_MINING/Hw3/breast-cancer-wisconsin.csv")
View(data)

set.seed(999)

#factorizing categorical value
summary(data)
data$F6<-as.integer(data$F6)
colSums(is.na(data))
data$Class=as.factor(data$Class)

#Building a model
options(max.print=999999)
idx<-sort(sample(nrow(data),round(.70*nrow(data))))
train<-data[idx,]
test<-data[-idx,]
test

#Applying CART methodology
cart=rpart(Class~.,data=train)
rpart.plot(cart)

cart_predict=predict(cart,test,type="class")
cart_predict
table(actual=test$Class,predicted=cart_predict)

#error rate
wrong<-sum(cart_predict!=test$Class)
error_rate<-wrong/length(cart_predict)
error_rate*100

prp(cart)
fancyRpartPlot(cart)

