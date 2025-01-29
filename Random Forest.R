rm(list=ls())
#Reading Data
library(readxl)
data<-read.csv("C:/Users/SAHIL MODY/OneDrive/Desktop/DATA MINING/Hw3/breast-cancer-wisconsin.csv")
View(data)

#Summary
summary(data)

#Convertng data
data$F6<-as.integer(data$F6)

#Checking Missing Values
colSums(is.na(data))

#Converting into factor
data$F1<-as.factor(data$F1)
data$F2<-as.factor(data$F2)
data$F3<-as.factor(data$F3)
data$F4<-as.factor(data$F4)
data$F5<-as.factor(data$F5)        
data$F6<-as.factor(data$F6)
data$F7<-as.factor(data$F7)
data$F8<-as.factor(data$F8)
data$F9<-as.factor(data$F9)
data$Class<-as.factor(data$Class)
View(data$F1)




#Creating Model
index<-sort(sample(nrow(data),round(.70*nrow(data))))
train1<-data[index,]
test1<-data[-index,]

#Plotting Model
#install.packages("randomForest")
library(randomForest)
?randomForest
RF<-randomForest(Class~.,data=train1,importance=TRUE,ntree=1000,na.action=na.exclude)
RF
importance(RF)
varImpPlot(RF)
Prediction<-predict(RF,test1)
conf_matrix<-table(acual=test1$Class,RF=Prediction)
conf_matrix
accuracy <- sum(diag(conf_matrix)/(sum(rowSums(conf_matrix)))) * 100
accuracy

