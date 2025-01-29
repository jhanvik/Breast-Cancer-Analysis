
rm(list = ls())

#reading libraries
library(readxl)
library(tidyverse)

#reading csv file
hw<- read.csv("C:/Users/SAHIL MODY/OneDrive/Desktop/DATA MINING/HW 2/breast-cancer-wisconsin.csv")
View(hw)

###I.	Summarizing each column (e.g. min, max, mean )

#converting F6 from character to integer
summary(hw)
hw$F6<-as.integer(hw$F6)
typeof(hw$F6)
summary(hw)

###II.	Identifying missing values

#Checking the type of every column
typeof(hw$Sample)
typeof(hw$F1)
typeof(hw$F2)
typeof(hw$F3)
typeof(hw$F4)
typeof(hw$F5)
typeof(hw$F6)
typeof(hw$Class)

#checking null values
which(is.na(hw$F6))
glimpse(hw)
colSums(is.na(hw))

###III.	Replacing the missing values with the "mean" of the column.
mean(hw$F6,na.rm = TRUE)
hw$F6[is.na(hw$F6)] <- mean(hw$F6,na.rm = TRUE)
colSums(is.na(hw))
glimpse(hw$F6[24])
view(hw$F6)


#IV.	Displaying the frequency table of "Class" vs. F6
library('plyr')
counts<-ddply(hw, .(hw$Class,hw$F6),nrow)
names(counts)<-c("Class","F6","Frequency")
counts


#V.	Displaying the scatter plot of F1 to F6, one pair at a time
pairs(hw[2:7], main="Scatterplot Example",pch=21,bg = c("red", "green3", "blue"))

#VI.	Show histogram box plot for columns F7 to F9
library(packHV)
par(mfrow=c(1,3))
hist_boxplot(hw$F7, freq = TRUE, density = FALSE, main = "F7",
             xlab = NULL, ymax = NULL,col="red")
hist_boxplot(hw$F8, freq = TRUE, density = FALSE, main = "F8",
             xlab = NULL, ymax = NULL,col="yellow")
hist_boxplot(hw$F9, freq = TRUE, density = FALSE, main = "F9",
             xlab = NULL, ymax = NULL,col="green")

  
  
#2) Delete all the objects from your R- environment.
rm(list = ls())

#Reload the "breast-cancer-wisconsin.data.csv" from canvas into R. 
hw1<- read.csv("C:/Users/SAHIL MODY/OneDrive/Desktop/DATA MINING/HW 2/breast-cancer-wisconsin.csv")
view(hw1)
summary(hw1)

#Remove any row with a missing value in any of the columns.
typeof(hw1$F6)
hw1$F6<-as.integer(hw1$F6)
typeof(hw1$F6)
colSums(is.na(hw1))
view(hw1)

#removed all the rows with missing value
test1 <-na.omit(hw1)
view(test1)
colSums(is.na(test1))
