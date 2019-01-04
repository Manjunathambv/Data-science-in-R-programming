getwd()
setwd("M:/study/Programming launguage/Assignments/cluster assignment/")
library(rJava)

library(writexl)
mydata <- read.csv("M3_Insurance_Data.csv")
View(mydata)

plot(mydata$Age, mydata$Income)

## k-means clustering

x <- data.matrix(mydata)
library(factoextra)
fviz_nbclust(x, kmeans, method = 'wss')+geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "Elbow method")

model1 <-kmeans(x,4)
model1


#C-means clustering
library(e1071)
c_means <- as.matrix(mydata)
c_means1 <- cmeans(c_means,3)
c_means1


