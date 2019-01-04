setwd("M:/study/Programming launguage/Concept/IPL/")
data1 <- read.csv("deliveries.csv")
data2 <- read.csv("matches.csv")
View(data1)
View(data2)

combinedData <- merge(data1, data2, by.x="match_id", by.y = "id")
View(combinedData)

## top 10 batsman and their plotting
library(dplyr)
library(ggplot2)


is.null(combinedData$total_runs)
class(combinedData$total_runs)

y <- combinedData %>%
      group_by(batsman)%>%
      summarise(x = sum(batsman_runs))%>%
      arrange(desc(x))%>%
      top_n(n=10, wt = x)
z <- ggplot(y, aes(x = reorder(batsman, -x), y=x))
z
z + geom_bar(aes(fill = batsman), stat = "identity")+labs(list(tittle="Top10Batsman",x="batsman", y="x"))+ theme(axis.text.x=element_text(angle=75, hjust=1), plot.title = element_text(size = 8, face = "bold"),text = element_text(size=8))



  
  

## top 10 wicket taking bowlers
combinedData %>%
  group_by(bowler)%>%
  summarise(total_wickets = length(dismissal_kind[dismissal_kind%in% c("caught","bowled","lbw","stumped","caught and bowled","hit wicket")]))%>%
  arrange(desc(total_wickets))%>%
  top_n(n=10, wt=total_wickets)



                  
#top 10 bowlers

Top10Bowlers <- combinedData %>%
                  group_by(TotalMaximumWicket=)
                  

  
