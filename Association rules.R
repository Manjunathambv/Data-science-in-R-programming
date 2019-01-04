library(recommenderlab)
library(arules)
library(arulesViz)

data("Adult")
itemFrequencyPlot(Adult, topN = 10)

## generating association rules

Associaltion_rule <- apriori(Adult)
inspect(Associaltion_rule)

Associaltion_rule1 <- apriori(Adult, parameter = list(minlen = 2, maxlen = 3, support = 0.7))
inspect(Associaltion_rule1)

Associaltion_rule3 <- apriori(Adult, parameter = list(support = 0.07, confidence = 0.5), appearance = list(lhs=c("capital-loss=None"), default = "rhs"))
inspect(Associaltion_rule3)
plot(Associaltion_rule3)




Associaltion_rule4 <- apriori(Adult, parameter = list(support = 0.07, confidence = 0.5), appearance = list(lhs=c("native-country=United-States"), default = "rhs"))
inspect(Associaltion_rule4)
plot(Associaltion_rule4)
