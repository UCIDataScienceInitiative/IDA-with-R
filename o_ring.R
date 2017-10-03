####################################################################################
## This file contains code for analyzing the O-Ring data from the UCI Machine
## Learning Repository to illustrate the pitfalls of linear regression & introduce 
## logistic regression.
## URL: https://archive.ics.uci.edu/ml/datasets/Challenger+USA+Space+Shuttle+O-Ring
####################################################################################

####################################################################################
######################## Data cleaning & preprocessing #############################
####################################################################################
## Load Data
oring <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/space-shuttle/o-ring-erosion-only.data")
head(oring)
names(oring) <- c("n_risk", "n_fail", "temp", "psi", "order")
head(oring)
str(oring)

## Summary of the data
summary(oring)

## Sort the data
oring <- oring[order(oring$temp), ]

####################################################################################
################## Exploratory Data Analysis (EDA) #################################
####################################################################################
## Plot of temp vs number of failures
plot(oring$temp, oring$n_fail, pch = 20,
     xlab = "Temperature (deg F)", ylab = "O-Ring Failure")

## Same plot with varying point size
pt.size <- rep(1, nrow(oring))
dups <- oring[duplicated(cbind(oring$temp, oring$n_fail)), c("n_fail", "temp")]
pt.size[as.numeric(rownames(dups))] <- 2
trips <- dups[duplicated(dups), ]
pt.size[as.numeric(rownames(trips))] <- 3
plot(oring$temp, oring$n_fail, pch = 20, cex = pt.size, 
     xlab = "Temperature (deg F)", ylab = "O-Ring Failure")

## easier way
library(ggplot2)
ggplot(oring, aes(temp, n_fail)) + 
  geom_count()

####################################################################################
################################ Linear Regression #################################
####################################################################################
## Fit a linear model
linearMod <- lm(n_fail ~ temp, data = oring)
summary(linearMod)

## Plot the fit
plot(oring$temp, oring$n_fail, pch = 20, cex = pt.size, 
     xlab = "Temperature (deg F)", ylab = "Num O-Ring Failures")
abline(reg = linearMod, col = "red", lwd = 2)

## Predict the output for the Challenger launch day
launchDay = data.frame(temp = 31)
predict(linearMod, launchDay, interval="predict")  # point estimate & 95% CI

## Plot the fit extrapolating to launch day
plot(oring$temp, oring$n_fail, pch = 20, cex = pt.size/2, 
     xlab = "Temperature (deg F)", ylab = "Num O-Ring Failures",
     xlim = c(30, 85), ylim = c(0, 5))
abline(reg = linearMod, col = "red", lwd = 2)
points(x=31, y=2.52, pch=4, col="black", lwd=2)

####################################################################################
############################## Logistic Regression #################################
####################################################################################
## Reformat the response variable
oring$fail <- as.numeric(oring$n_fail > 0)

## plot reformatted data
plot(oring$temp, oring$fail, pch = 20,
     xlab = "Temperature (deg F)", ylab = "O-Ring Failure")

## Fit a GLM with logistic link
logisticMod <- glm(fail ~ temp, data = oring, family=binomial(link="logit"))
summary(logisticMod)

## plot the fit
plot(oring$temp, oring$fail, pch = 20, cex = pt.size,
     xlab = "Temperature (deg F)", ylab = "O-Ring Failure")
curve(predict(logisticMod, data.frame(temp=x), type="response"), add=TRUE)

## Predict the probability of failure for the Challenger launch day
predict(logisticMod, launchDay, type="response")

