rm(list=ls())

#importing the dataset 
cancer <- read.csv("C:/Users/SAHIL MODY/OneDrive/Desktop/DATA_MINING/HW7/wisc_bc_ContinuousVar.csv")
View(cancer)
#deleting the first row (Data handling)
cancer1 = subset(cancer, select = -c(id) )

#Factorising the diagnosis column 
cancer1$diagnosis <- factor(cancer1$diagnosis, levels = c('M','B'),labels = c(1,2))

#Splitting the dataset into training and testing 
index<-sort(sample(nrow(cancer),as.integer(.70*nrow(cancer))))
train<-cancer1[index,]
test<-cancer1[-index,]

#Performing SVM Model 
library(e1071)
svmmodel <- svm( diagnosis~ ., data =train  )
svmpred <- predict(svmmodel,  test )

#Confusion matrix 
conf_matrix <- table(predicted=svmpred,class=test$diagnosis)
print(conf_matrix)

#Accuracy 
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)
