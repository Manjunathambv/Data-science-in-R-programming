## assignment

libray(AER)
getwd()
library(AER)
data("Affairs")
mydata <- data.frame(Affairs)


## converting all columsns into yes and no type variavle
mydata$yesno<- ifelse(mydata$affairs>0,"yes", "no")
mydata$yesno <-as.factor(mydata$yesno)
View(mydata)

mydata <- mydata[-1]
View(mydata)

##Splitting sample is happening 

library(caTools)
set.seed(3)
splittingSample <- sample.split(mydata$yesno, SplitRatio = 0.7)
train <- subset(mydata, splittingSample == "TRUE")
test <- subset(mydata, splittingSample == "FALSE")

##Decision tree
library(rpart)
model1 <- rpart(yesno~., train)
model1
summary(model1)
plot(model1, margin=0.1)
text(model1, pretty = T, cex=0.7)

## predict with test 
predi <- predict(model1, test, type = "class")
predi

library(caret)
confusionMatrix(table(predi, test$yesno))


## random forest
library(randomForest)
modelA <- randomForest(yesno~., train)
modelA
summary(modelA)


## predict with test 
prediA <- predict(modelA, test, type = "class")
prediA

confusionMatrix(table(prediA, test$yesno))


