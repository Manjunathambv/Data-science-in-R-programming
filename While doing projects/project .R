getwd()

setwd("M:/study/Programming launguage/Project/")
mydata <- read.csv("338_cert_proj_datasets_v3.0.csv")
str(mydata)
mydata$left_Notleft <- factor(mydata$left)
View(mydata)

set.seed(100)
temp <- sample(mydata[1:2000,])## here i made sample from the mydata to know the relationship between thevariable(but not taking 2000 from mydata it took only 2000 from 1st row)
colnames(temp)
temp$lfnt <- factor(temp$left)
View(temp)
str(temp)

#other method for sampling of 20% from the mydata
set.seed(101)
temp1 <- sample(1:nrow(mydata), 0.2*nrow(mydata))## here took 20% from mydata this is the correct method
temp2 <- mydata[temp1,]
View(temp2)
str(temp2)
temp2$left <- as.factor(temp2$left)


# here we are finding the relationship between the variable
x <- ggplot(temp2, aes(x = satisfaction_level, y = average_montly_hours))
x + geom_point()
y <- ggplot(temp2, aes(x = left, y= temp2$satisfaction_level))
y + geom_point()
## let us find the relationship and correlation between tha attributes


ggplot()

library(rpart)
library(caTools)
library(caret)
library(ggplot2)

## here we are splitting the data
set.seed(1234)
id <- sample(2, nrow(temp2), replace = TRUE, prob = c(0.8, 0.2))
trainset <- temp2[id==1,]
testset <- temp2[id==2,]

## deccision tree with part package
install.packages("party")
library(party)
model1 <- ctree(left~., data = trainset)
model1
plot(model1, margin=0.1)

## building model using decision tree
model1 <- rpart(left~., trainset)
plot(model1, margin = 0.1)
text(model1, pretty = T, cex = 0.7)

predi1 <- predict(model1, newdata = testset, type = "class")
predi1
y <- table(PredictedValues=predi1, ActualValues = testset$left)
## creating confusion matrix

library(caret)
confusionMatrix(table(PredictedValues=predi1, ActualValues = testset$left))
#missleading errors
1-sum(diag(y)/sum(y))

## Random forest
library(randomForest)
model3 <- randomForest(left~., data=trainset)
model3
## predict the random forest
predi3 <- predict(model3, testset, type = "class")
predi3
table(actualValues3 = testset$left, predctedvalues3 = predi3)
# confusion matrix table
confusionMatrix(table(actualValues3 = testset$left, predctedvalues3 = predi3))

## let us do cluster problem
KmeansClustering <- data.matrix(temp2)
library(factoextra)
fviz_nbclust(KmeansClustering, kmeans, method = 'wss')+geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "Elbow method")
model4 <- kmeans(KmeansClustering, 4)
model4


