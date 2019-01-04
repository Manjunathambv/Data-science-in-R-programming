getwd()
setwd("M:/study/Programming launguage/Assignments/linear regression/")
Videogameset <- read.csv("M4_Videogame.csv")
View(Videogameset)
str(Videogameset)
summary(Videogameset)

names(Videogameset)
library(caTools)
library(corrplot)

NA_sales <- Videogameset$NA_players 
EU_sales <- Videogameset$EU_players
JP_sales <- Videogameset$JP_players
Other_sales<-Videogameset$Other_players
Global_sales<-Videogameset$Global_players

Newvideogamesetdata <- data.frame(NA_sales, EU_sales, JP_sales, Other_sales)
str(Newvideogamesetdata)

CORplotnewvideogamesetdata <- cor(Newvideogamesetdata)

corrplot(CORplotnewvideogamesetdata)


set.seed(1212)   
Split <- sample.split(Newvideogamesetdata$Other_sales, SplitRatio = 0.7)
Train <- subset(Newvideogamesetdata, Split=="TRUE")
test <- subset(Newvideogamesetdata, Split=="FALSE")

Train

## creating regression model


model1 <- lm(Other_sales~., Train)
summary(model1)
model1

model2 <- lm(Global_sales~. -Other_sales, Train)
summary(model2)

#predicting the values for othersales, from test data
prectionOfSales <- predict(model1, test)
summary(prectionOfSales)



# here we are plotting for 100 data so we are creating subset
testSubset <- test[1:100,]

## plotting actual values with the predicted values
plot(testSubset$Other_sales[1:100], type = 'l')
lines(prectionOfSales[1:100], col="red")

