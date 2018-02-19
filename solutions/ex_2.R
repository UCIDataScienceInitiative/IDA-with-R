####################################################################################
### EXERCISE 2 Solutions
### Author: Chris Galbraith
####################################################################################
### PART A ###
# A.1
load(here::here("data", "auto_mpg_v2.Rda"))

# A.2
summary(auto)

### PART B ###
# B.1
hist(auto$mpg, col = "grey", freq=FALSE, main = "Histogram of MPG", xlab = "MPG")

# B.2
lines(density(auto$mpg, na.rm=TRUE), col="red")

# B.3
abline(v = median(auto$mpg, na.rm=TRUE), col = "red", lwd = 2, lty=2)

### PART C ###
boxplot(mpg ~ cyl, data = auto, col = "grey",
        main = "Distribution of MPG by Number of Cylinders",
        xlab = "Cylinders", ylab = "MPG")

### PART D ###
library(car)
scatterplotMatrix(auto[,c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr")])

