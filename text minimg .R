setwd("M:/study/Programming launguage/Concept/text mining/")
mydata <- readLines("report.txt")
mydata

# to remove punctuation ! and - , . etc are removed
mydata1 <- gsub(pattern = '\\W', replace= " ", mydata)
mydata1
 
 
# to remove numbers
mydata2 <- gsub(pattern = "\\d", replace = " ", mydata1)
mydata2

## For case sensitive i mean for lower cases 
mydata3 <- tolower(mydata2)

library(tm)
# to remove stopwards i.e the, that, and , is, to
mydata4 <- removeWords(mydata3, stopwords())
mydata4

# to remove 's, 't single words 
mydata5 <- gsub(pattern = "\\b[A-z]\\b", replace = " ", mydata4)
mydata5


## to remove white space
mydata6 <- stripWhitespace(mydata5)
mydata6


## Sentimet analysis and word cloud we need to install stringR and wordcloud
library(stringr)
library(wordcloud)
library(RColorBrewer)


## Sentiment analysis : to split sentece into single words and then convert to character vector
mydata7 <- str_split(mydata6, pattern="\\s+")
mydata7
class(mydata7)
# to convert list into character
mydata8 <- unlist(mydata7)
mydata8
class(mydata8)


## after converting into charcter of each word let us calulate the positive word
#and negative word whichever scores higher is the sentiment analysis (which defines positive or negative)

poswords <- scan("positive-words.txt", what = "character", comment.char =  ";")
poswords
#negwords <- readLines("negative-words.txt") instead of reading the line scan for the file that would be better for senti analysis
negwords <- scan("negative-words.txt", what = "character", comment.char =  ";")

sum(!is.na(match(mydata8, poswords)))
sum(!is.na(match(mydata8, negwords)))
score <- sum(!is.na(match(mydata8, poswords)))-sum(!is.na(match(mydata8, negwords)))
score

mean(score)
sd(score)
hist(score)

## wordcloud
wordcloud(mydata8, min.freq = 1, random.order = FALSE, scale = c(3,0.5), color=rainbow(4))

