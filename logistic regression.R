getwd()
setwd("M:/study/Programming launguage/manju programme")

x <- read.csv("Diabetes.csv")

dim(x)
summary(x)
View(x)

library(corrplot)
library(dplyr)
library(MASS)
library(caTools)


str(x)
class(x$Is_Diabetic)
summary(is.na(x$Is_Diabetic))
levels(x$Is_Diabetic)[levels(x$Is_Diabetic) == "YES"] <- "1"
levels(x$Is_Diabetic)[levels(x$Is_Diabetic) == 'NO']<- "0"
x$Is_Diabetic
table(x$Is_Diabetic)
x$Is_Diabetic <- as.numeric(x$Is_Diabetic)
class(x$Is_Diabetic)

str(x)

corplotOFx <- cor(x)
corrplot(corplotOFx, type = "upper")


set.seed(1234)
splitsamleX <-sample.split(x$Is_Diabetic, SplitRatio = .7)
summary(splitsamleX)

Trainingdata <- subset(x, splitsamleX == "TRUE")
Testingdata <- subset(x, splitsamleX == "FALSE")

str(Trainingdata)
formula1 <- 'Is_Diabetic~.'
str(formula1)
model1 <- glm(formula1, data = Trainingdata, family = 'binomial')
summary(model1)

formula2 <- 'Is_Diabetic ~ . -skin_fold_thickness  -X2.Hour_serum_insulin -Age'

model2 <- glm(formula2,   Trainingdata, family = 'binomial')
summary(model2)


#Prediction of the other testing data set to check out easity weather our model has done great job or not
# here prection is based on the testing data set
predictionModel1 <- predict(model1, Testingdata, type='response')
predictionModel2 <- predict(model2, Testingdata, type='response')
summary(predictionModel1)
summary(predictionModel2)

library(caret)
library(lattice)
library(ggplot2)
#confusion matrix
table(actualValues1 = Testingdata$Is_Diabetic, predictionModel2>0.3)
table(actualvalues2 = Testingdata$Is_Diabetic, predictionModel2>0.7)


library(ROCR)
RocPrediction <- prediction(predictionModel1, Testingdata$Is_Diabetic)
Rocperf <- performance(RocPrediction, "tpr", "fpr")

plot(Rocperf, col='blue', print.cutoffs.at = seq(0.1, by=0.1),text.adj= c(-0.5, 1.7), cex=0.9)



