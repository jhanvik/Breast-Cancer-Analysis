
## remove all objects
rm(list=ls())
library(naivebayes)
library(e1071)

#Importing Dataset
library(readxl)
data<-read.csv("C:/Users/SAHIL MODY/OneDrive/Desktop/DATA_MINING/Hw3/breast-cancer-wisconsin.csv")
View(data)


#DATA CLEANING
summary(data)
data$F6<-as.integer(data$F6)
colSums(is.na(data))
data<-na.omit(data)
View(data)

class(data)
prop.table

table(class=data$Class)
prop.table(table(Class=data$Class)) 







#normalizing data
normalized<-function(x,minx,maxx){z<-((x-minx)/(maxx-minx))
return (z)
}
normalized_data<-as.data.frame (
  cbind(Sample=normalized(data[,1],min(data[,1]),max(data[,1])),
        F1=normalized(data[,2],min(data[,2]),max(data[,2])),
        F2=normalized(data[,3],min(data[,3]),max(data[,3])),
        F3=normalized(data[,4],min(data[,4]),max(data[,4])),
        F4=normalized(data[,5],min(data[,5]),max(data[,5])),
        F5=normalized(data[,6],min(data[,6]),max(data[,6])),
        F6=normalized(data[,7],min(data[,7]),max(data[,7])),
        F7=normalized(data[,8],min(data[,8]),max(data[,8])),
        F8=normalized(data[,9],min(data[,9]),max(data[,9])),
        F9=normalized(data[,10],min(data[,10]),max(data[,10])),
        Class=(normalized(data[,11],min(data[,11]),max(data[,11])))
  )
)

normalized_data




#representing a categorical value into factor
normalized_data$Class<-as.factor(normalized_data$Class)
typeof(normalized_data$Class)
View(normalized_data$Class)



#Creating a model
options(max.print=999999)
idx<-sort(sample(nrow(normalized_data),as.integer(.70*nrow(normalized_data))))
idx
#training data
train<-normalized_data[idx,]
train
#testing data
test<-normalized_data[-idx,]
test


?naivebayes


predict_nb <- naiveBayes(Class~., train, test)
category<-predict(predict_nb,test)


## Compare the prediction to actual
data_class<-cbind(test,category)
table(Class=test$Class)
conf_matrix<-table(Actual=test$Class,Predicted=category)
prop.table(table(Actual=test$Class,Predicted=category))


accuracy <- sum(diag(conf_matrix)/(sum(rowSums(conf_matrix)))) * 100
accuracy






