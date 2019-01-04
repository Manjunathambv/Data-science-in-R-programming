## Some basic concept of R programming launguage
setwd("M:/study/Programming launguage/manju programme/")
Mydata <- read.csv("all_transactions.csv")

## pattren matching and replcing function
## suppose i have a col name like this 
x1 <- c("America","Americas" , "United states of America", "France", "Germany", "USA")# here america is used as many times in different forms
pattern <- "America|USA"

#To find out pertcula pattern in the data set as string
grep(pattern, x1)
# to change all of the occurence by means of replacement
x1[grep(pattern,x1)] <- "USA"
x1


## let us find how to replce the values
x2 <- c("R tutorial R tutorial", "php tutorial", "python tutorial", "HtMl tutorial")
x2
## here i want to chnage tutorial by examples
sub("tutorial", "Example", x2)# subsitituting tutorial with exxample
# however in the 1st elemt there are two occureance of tutorial in order to change it 
# we have to use gsub(global substitute)
gsub("tutorial", "Example", x2)


x2 <- c("R TUTORIAL R tutorial", "php tutorial", "python tutorial", "HtMl tutorial")
gsub("tutorial", "Example", x2, ignore.case = T)

## substr command to exact perticular charcter in word
x3 <- c("Red", "Green", "Blue")
substr(x3, 2, 3)


## how to split the data
x4 <- "I love edureka and manju in it"
x5 <- strsplit(x4, " ")
class(x5)
x6 <- unlist(x5)
class(x6)

## sorting and ordering
#1) Sorting
x6 <- c(8, 0, 15, 87, 44, 55)
sort(x6)
order(x6)




