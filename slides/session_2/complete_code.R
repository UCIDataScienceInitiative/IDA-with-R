####################################################################################
### SESSION 2 - Complete code from slides
### Author: Chris Galbraith 
####################################################################################
## Functions in R
?sample

sampSpace <- 1:6 
sample(sampSpace, 1)  # arguments with default values can be omitted
sample(size = 1, x = sampSpace)  # no need to remember the order 
sample(size = 1, sampSpace)


## str()
str(str)
str(sample)

prestige <- read.table(file = here::here("data", "prestige_v2.csv"), 
                       sep=",", 
                       header=TRUE, 
                       row.names=1)
str(prestige)


## EDA - Numeric Summary
summary(prestige)


## Histograms
hist(prestige$prestige, freq = FALSE, 
     col = "grey",
     main = "Histogram of Prestige Score",
     xlab = "Prestige Score")
abline(v = median(prestige$prestige), col = "blue", lty = 2, lwd = 2)


## Histogram with overlaid density 
hist(prestige$prestige, freq=FALSE, col = "grey", main = "", xlab = "Prestige Score", ylim=c(0, 0.022))
abline(v = median(prestige$prestige), col = "blue", lty = 2, lwd = 2)
lines(density(prestige$prestige), col = "red", lwd = 2)


## Adding a Legend
hist(prestige$prestige, freq=FALSE, col = "grey", main = "", xlab = "Prestige Score", ylim=c(0, 0.022))
abline(v = median(prestige$prestige), col = "blue", lty = 2, lwd = 2)
lines(density(prestige$prestige), col = "red", lwd = 2)
legend("topright", legend = c("Median", "Density Est."),
       col = c("blue", "red"), lty = c(2, 1), lwd = 2, bty = "n")


## Boxplots
summary(prestige$prestige)
boxplot(prestige$prestige, horizontal = TRUE, xlab = "Prestige Score")


## Grouped Boxplots
boxplot(prestige ~ type, data = prestige, col = "grey",
        main = "Distribution of Prestige Score by Type of Occupation",
        xlab = "Occupation Type", ylab = "Prestige Score")


## Scatterplots
plot(x = prestige$education, y = prestige$prestige, type = "p", pch = 20,
     main = "Prestige Score by Education",
     xlab = "Avg Years of Education", ylab = "Prestige Score")


## Scatterplots, contd.
plot(prestige$education, prestige$prestige, type = "p", pch = 20,
     main = "Prestige Score by Education",
     xlab = "Ave. Years of Education", 
     ylab = "Prestige Score")
abline(reg = lm(prestige ~ education, data = prestige), col = "green", lwd = 2)  # linear regression
lines(lowess(x = prestige$education, y = prestige$prestige), col = "red", lwd = 2)  # smoother
legend("topleft", bty = "n",
       legend = c("Regression Line", "Smoother"), 
       col = c("green", "red"),
       lwd = c(2,2), 
       lty = 1)


## Scatterplot Matrices
library(car)
scatterplotMatrix( prestige[ ,c("prestige","education","income","women")] )
