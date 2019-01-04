getwd()

z <- read.csv("Disease_data (Assignment Dataset).csv")
mode(z)
View(z)
str(z)
class(z$Age)
#to covert factor to numeric, initially it contains chr "seven" in one of the column
#to convert that first chracter "seven needs to '7'" by means of levels command
# to convert factors into numeric first it is converted in to character and then to the numeric
# levels command is used to access the attributes

#converted age into numeric
levels(z$Age) 
?levels
levels(z$Age)[levels(z$Age) == "seven"] <- "7"
levels(z$Age)
class(z$Age)
range(z$Age)
z$Age <- as.numeric(as.character(z$Age))
class(z$Age)

mode(z$sex)
class(z$sex)
levels(z$sex) # it can be used to access the observation of that variable
table(z$sex) # table counts the obsevation and its respresened in Table
which(z$sex == "-1")
SEX <- as.character(z$sex)
SEX[22] <- "Male"
z$sex <- as.factor(SEX)

# time and date format
z$timesupper
class(z$timesupper)
mean(z$timesupper, na.rm = TRUE)
z$timesupper[which(is.na(z$timesupper))] <- "2030"
z$timesupper
z$timesupper <- strptime(z$timesupper, format = "%H%M")
z$timesupper

supperdate <- "1940-04-18"
supper.datetime <- paste(supperdate, z$timesupper)
supper.datetime
z$timesupper <- strptime(supper.datetime, format = "%Y-%m-%d %H%M")
z$timesupper
View(z)

#settingup the date colum
z$onsetdate
class(z$onsetdate)
table(z$onsetdate)
levels(z$onsetdate)
levels(z$onsetdate)[levels(z$onsetdate) == "18/4"] <- "18-Apr"
levels(z$onsetdate)
View(z)

## setting uptime
z$onsettime
class(z$onsettime)
range(z$onsettime)## amele madu

## food column
z$chocolate[which(is.na(z$chocolate))] <- "yes"
z$fruitsalad[46] <- "yes"
z$fruitsalad
z$chocolate
class(z$fruitsalad)
class(z$chocolate)
z$fruitsalad <- as.character(z$fruitsalad)
z$fruitsalad
z$fruitsalad<-as.factor(z$fruitsalad)
z$fruitsalad




### once our data is clean we need to visualise the data
#1 most consumed food among the patients
View(z)
food <- z[,6:19]
View(food)
class(food)
doc <- summary(food)
hist(which(food=="yes"), main = "most consumed food", labels = seq(1,14,1))
colnames(food[12])

##Average age of the peopble who are ill
boxplot(z$Age)
avg <- boxplot(z$Age, main="avg age of people who are ill")
avg$stats


##gender ratio
plot(z$sex)










