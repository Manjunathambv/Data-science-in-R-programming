getwd()
setwd("M:/study/Programming launguage/manju programme/")
x <- read.csv("Diabetes.csv", stringsAsFactors = TRUE)

x
dim(x)
View(x)
summary(x)
str(x)
cor(x)

x$Is_Diabetic <- as.character(x$Is_Diabetic)
class(x$Is_Diabetic)
levels(x$Is_Diabetic)
table(x$Is_Diabetic)
x$Is_Diabetic
x$Is_Diabetic[x$Is_Diabetic == "YES"]<-"1"
x$Is_Diabetic[x$Is_Diabetic == "NO"]<-"0"
x$Is_Diabetic
x$Is_Diabetic <- as.integer(x$Is_Diabetic)


x$Is_Diabetic <- as.integer(x$Is_Diabetic)
cor(x)

corrplot::corrplot(cor(x))

library("corrplot")

library(dplyr)
library(hflights)

z <- tbl_df(x)
z
## filter in dplay
m <- filter(z, z$glucose_conc>100)
m


##select in dplyr , it will pic column by name
select(z, glucose_conc, blood_pressure)
select(z, glucose_conc:BMI, contains("Age"), contains("Is_Diabetic"))


## chaining or pipelining
z %>%
  select(glucose_conc, Age) %>%
  filter(Age > 50)
  
x1 <- 1:5
x2 <- 2:6
(x1-x2)^2 %>%sum()%>%sqrt()


## arrange: re order rows
z %>%
  select(BMI, Age)%>%
  arrange(desc(Age))


## mutate is used to define new variable with the existing variable


### grouping and summerise
z %>%
  group_by(Age) %>%
  summarise(AvgSugarContent = mean(glucose_conc), na.rm = TRUE)








