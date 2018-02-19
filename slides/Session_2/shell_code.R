####################################################################################
### SESSION 2 - Shell code from slides
####################################################################################
## Functions in R
?sample

sampSpace <- 1:6 
sample(sampSpace, 1)  # arguments with default values can be omitted


## str()
str(str)
str(sample)

prestige <- read.table(file = here::here("data", "prestige_v2.csv"),
                       sep=",", 
                       header=TRUE, 
                       row.names=1)



## EDA - Numeric Summary



## Histograms
?hist
hist(prestige$prestige, freq = FALSE, 
     col = "grey",
     main = "Histogram of Prestige Score",
     xlab = "Prestige Score")
?abline
abline(v = median(prestige$prestige), col = "blue", lty = 2, lwd = 2)


## Histogram with overlaid density 
?lines
?density
hist(prestige$prestige, freq=FALSE, col = "grey", main = "", xlab = "Prestige Score", ylim=c(0, 0.022))
abline(v = median(prestige$prestige), col = "blue", lty = 2, lwd = 2)


## Adding a Legend
?legend
hist(prestige$prestige, freq=FALSE, col = "grey", main = "", xlab = "Prestige Score", ylim=c(0, 0.022))
abline(v = median(prestige$prestige), col = "blue", lty = 2, lwd = 2)
lines(density(prestige$prestige), col = "red", lwd = 2)


## Boxplots



## Grouped Boxplots
boxplot(
        col = "grey",
        main = "Distribution of Prestige Score by Type of Occupation",
        xlab = "Occupation Type", 
        ylab = "Prestige Score")


## Scatterplots
plot(
     main = "Prestige Score by Education",
     xlab = "Avg Years of Education", ylab = "Prestige Score")


## Scatterplots, contd.
plot(prestige$education, prestige$prestige, type = "p", pch = 20,
     main = "Prestige Score by Education",
     xlab = "Ave. Years of Education", 
     ylab = "Prestige Score")
?abline
abline(, col = "green", lwd = 2)  # linear regression
?lowess
lines(, col = "red", lwd = 2)  # smoother
legend("topleft", bty = "n",
       legend = c("Regression Line", "Smoother"), 
       col = c("green", "red"),
       lwd = c(2,2), 
       lty = 1)


## Scatterplot Matrices
library(car)
