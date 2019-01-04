getwd()

moviesDataFrame <- read.csv("movie_metadata1.csv", stringsAsFactors = FALSE)
moviesDataFrame
class(moviesDataFrame)
View(moviesDataFrame)
dim(moviesDataFrame)
summary(moviesDataFrame)

str(moviesDataFrame)

moviesDataFrame[moviesDataFrame$duration > 250, "movie_title"]
moviesDataFrame[c(1,4), c("movie_title", "duration")]

moviesDataFrame[moviesDataFrame$duration > 250, c("movie_title", "duration")]


# topt 10 movies based on gross income 
head(moviesDataFrame[order(moviesDataFrame$gross, decreasing = TRUE), c("movie_title", "gross")], 10)

# top rated movies based on imdb score 
head(moviesDataFrame[order(moviesDataFrame$imdb_score, decreasing = TRUE), c("movie_title", "imdb_score")], 10)

mean(moviesDataFrame$imdb_score)

                     
x <- aggregate(moviesDataFrame$movie_title, by = list(moviesDataFrame$title_year), FUN = length)

plot(x)


y <- aggregate(moviesDataFrame$imdb_score, by = list(moviesDataFrame$title_year), FUN = mean)


plot(y)
#Clening the data

moviesDataFrame
str(moviesDataFrame)


is.character(moviesDataFrame$movie_title)
is.factor(moviesDataFrame$movie_title)

moviesDataFrame$movie_title <- as.character(moviesDataFrame$movie_title)
moviesDataFrame$movie_title <- as.factor(moviesDataFrame$movie_title)
moviesDataFrame$movie_title

is.numeric(moviesDataFrame$imdb_score)
moviesDataFrame$imdb_score

moviesDataFrame$imdb_score <- as.factor(moviesDataFrame$imdb_score)
moviesDataFrame$imdb_score
moviesDataFrame$imdb_score <- as.integer(as.character(moviesDataFrame$imdb_score)) #both are same
moviesDataFrame$imdb_score <- as.integer(moviesDataFrame$imdb_score)# integer gives round of values

class(moviesDataFrame$director_name)
summary(moviesDataFrame)

#To eliminate all NA values in moviesdataframe 
sum(is.na(moviesDataFrame))
length(which(is.na(moviesDataFrame)))

newMOvies <- na.omit(moviesDataFrame)
newMOvies

nrow(newMOvies)
nrow(moviesDataFrame)

nrow(moviesDataFrame) - length(which(is.na(moviesDataFrame)))

newMOvies$director_name
newMOvies$color
sum(newMOvies$color=="")
which(newMOvies$color=="")
newMOvies$color <- as.character(newMOvies$color)
newMOvies$color
newMOvies[which(newMOvies$color == "Blank value"), "color"]

colorMovies <- subset(newMOvies, newMOvies$color == 'color')
BWMovies <- subset(newMOvies, newMOvies$color == 'blackand white')

newMOvies$movie_title <- gsub("Â", "", newMOvies$movie_title)
newMOvies$movie_title
newMOvies$profit <- newMOvies$gross - newMOvies$budget
newMOvies$movie_title


newMOvies$movie_title <- sub(pattern = )







































