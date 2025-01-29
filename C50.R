rm(list=ls())
#Reading Data
library(readxl)
data<-read.csv("C:/Users/SAHIL MODY/OneDrive/Desktop/DATA_MINING/Hw3/breast-cancer-wisconsin.csv")
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
train<-data[index,]
test<-data[-index,]

#Plotting C50
library(C50)
C50<-C5.0(Class~.,data=train)
print(C50)
summary(C50)
plot(C50)

#Predicting Values
predict<-predict(C50,test,type='class')
predict

#Confusion Matrix
confusion_matrix<-table(Actual=test$Class,C50=predict)
confusion_matrix

#Accuracy
accuracy <- sum(diag(confusion_matrix)/(sum(rowSums(confusion_matrix)))) * 100
accuracy




