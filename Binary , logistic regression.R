## logistic regression
getwd()
setwd("M:/study/Programming launguage/Assignments/logistic regression/")
mydata <- read.csv("binary.csv")
View(mydata)
str(mydata)

## in logistic regression the output varivable should be factor or cactegorical variable
## here admit is yes or no type because of 1 and 0 values similary the rank also 1,2,3,4 type so it should be a factor variable

mydata$admit <- as.factor(mydata$admit)
mydata$rank <- as.factor(mydata$rank)
str(mydata)

library(caTools)

set.seed(1234)
SplitMydata <- sample.split(mydata, SplitRatio = 0.8)
train <- subset(mydata, SplitMydata == "TRUE")
test <- subset(mydata, SplitMydata == "FALSE")

##innond tara split without ca tool
ind <- sample(2, nrow(mydata), replace = T, prob= c(0.8, 0.2))
train_mydata <- mydata[ind == 1,]
test_mydata <- mydata[ind == 2,]

## performing logistic reression
model1 <- glm(admit~ ., data = train, family = 'binomial')
summary(model1)

model2 <- glm(admit~. -gre, data = train, family = 'binomial')
summary(model2)


## now model is ready and now start with prediction
predictModel2 <- predict(model2, train, type = 'response')


## miscalculation of errors by actual value and from the predicted data
predi <- ifelse(predictModel2>0.5, 1, 0)

x <-table(actualVale = train$admit, predictedValue = predi)
x
## calculation of error

1-sum(diag(x))/sum(x)



#similary we have do prediction for test data set
# if error from both sets are compared whichever is less we need to take that model
# model performance evaluation by ROCR curve
library(ROCR)
Rocprediction <- prediction(predictModel2, train$admit)

evl<- performance(Rocprediction, "acc" )
plot(evl)







