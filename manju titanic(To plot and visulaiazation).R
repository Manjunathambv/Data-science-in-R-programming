getwd()
setwd("M:/study/Programming launguage/Concept/Titanic data set/")
Titanic <- read.csv("titanic.csv")
View(Titanic)
str(Titanic)

Titanic$Survived <- as.factor(Titanic$Survived)
Titanic$Pclass <- as.factor(Titanic$Pclass)
Titanic$Age<-as.factor(Titanic$Age)
Titanic$Embarked<-as.factor(Titanic$Embarked)

library(dplyr)
library(ggplot2)

ggplot(Titanic, aes(x=Survived))+
  geom_bar()

#Adding some custamization to the title

ggplot(Titanic, aes(x=Survived))+
  theme_bw()+
  geom_bar()+
  labs(title = "Titanic survived rates", y="passanger count")

# based on the sex how much they have survived
ggplot(Titanic, aes(x = Sex, fill = Survived))+
  theme_bw()+
  geom_bar()+
  labs(title = "Titanic survived rates by sex rate", y="passanger count")
 
# survival rate by class 

ggplot(Titanic, aes(x = Pclass, fill = Survived))+
  theme_bw()+
  geom_bar()+
  labs(title = "Titanic survived rates by pclass rate", y="passanger count")

# based on the class of ticket and the gender
ggplot(Titanic, aes(x = Sex, fill = Survived))+
  theme_bw()+
  facet_wrap(~Pclass)+
  geom_bar()+
  labs(title = "Titanic survived rates by pclass and sex", y="passanger count")

### now its time for numeric data
ggplot(Titanic, aes(x = Age, fill = Survived)+
  geom_histogram(binwidth = 5)+
  labs(y ="passanger count",  x ="Age", title = "Titanic age distribution")


