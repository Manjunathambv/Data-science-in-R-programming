library(ggplot2)

library(reshape)

library(plyr)

getwd()
setwd("M:/study/Programming launguage/manju programme/")
facebook <- read.delim("FacebookNarcissism_5u6ip.dat")
View(facebook)

ggplot(facebook)
head(facebook)
ggplot(facebook, aes(NPQC_R_Total, Rating))
geom_point()
graph <- ggplot(facebook, aes(NPQC_R_Total, Rating))
graph+geom_point()
graph+geom_point(shape = 5)
graph+geom_point(size = 2)
graph+geom_point(aes(colour = Rating_Type))
graph+geom_point(aes(colour = facebook$Rating_Type), position = "jitter")
?jitter
graph+geom_point(aes(shape = facebook$Rating_Type), position = "jitter")


#scatterplots
examData <- read.delim("Exam_Anxiety_hbnsh.dat")
plot(examData)
View(examData)
summary(examData)
scatter <- ggplot(examData, aes(Anxiety, Exam))
#simple scatter plots
scatter+geom_point()+labs(x = "exam anxity", y="exam performance")

#simple scatter with smooth
scatter+geom_point()+geom_smooth()+labs(x = "exam anxity", y="exam performance")
?geom_smooth
scatter+geom_point()+geom_smooth()+geom_smooth(method = 'lm', colour = "red", se = F)+labs(x = "exam anxity", y="exam performance")

scatter+geom_point()+geom_smooth(method = 'lm', colour = "red")+labs(x = "exam anxity", y="exam performance")
scatter+geom_point()+geom_smooth(method = 'lm', colour = "red", alpha = 0.1, fill = "red")+labs(x = "exam anxity", y="exam performance")
scatter+geom_point()+geom_smooth(method = 'lm', aes(fill = Gender, alpha = 0.1))+labs(x = "exam anxity", y="exam performance")

#density plot
festivaldata <- read.delim("DownloadFestival(No_Outlier)_4lw2vi.dat")
festivalDensity = ggplot(festivaldata, aes(festivaldata$day1))
festivalDensity+geom_density()+labs(x = "Hygiene (Day 1 of Festival)", y = "Density Estimate")

## boxplot
festivalBoxplot <- ggplot(festivaldata, aes(gender, day1))
festivalBoxplot+geom_boxplot()+labs(x = "Gender", y = "Hygiene (Day 1 of Festival)")
saveInImageDirectory("festival box plot.png")


## with outlier
festivalBoxplot2 <- read.delim("DownloadFestival_j1083f.dat")
festivalBoxplot3 <- ggplot(festivalBoxplot2, aes(gender, day1))
saveInImageDirectory("04 ")


