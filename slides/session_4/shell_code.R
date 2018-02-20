####################################################################################
### SESSION 4 - Shell code from slides
####################################################################################
## O-Ring Data
oring <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/space-shuttle/o-ring-erosion-only.data")
names(oring) <- c("n_risk", "n_fail", "temp", "psi", "order")


## Visualizing the O-Ring Data
oring <- oring[order(oring$temp), ]  # sort by ascending temp
# some flights have the same number of failures & launch temp, so make point size vary 
pt.size <- rep(1, nrow(oring))
dups <- oring[duplicated(cbind(oring$temp, oring$n_fail)), c("n_fail", "temp")]
pt.size[as.numeric(rownames(dups))] <- 2
trips <- dups[duplicated(dups), ]
pt.size[as.numeric(rownames(trips))] <- 3
plot(oring$temp, oring$n_fail, pch = 20, cex = pt.size, 
     xlab = "Temperature (deg F)", ylab = "Number of Failures")  


## Naive Analysis of the O-Ring Data - Linear Model
linearReg <- 


## Naive Analysis Results - Predict for launch day
launchDay <- 


## Naive Analysis Results - Plot the fit extrapolating to launch day
plot(oring$temp, oring$n_fail, pch = 20, cex = pt.size/2, 
     xlab = "Temperature (deg F)", ylab = "Num O-Ring Failures",
     xlim = c(30, 85), ylim = c(0, 5))
abline(reg = linearReg, col = "red", lwd = 2)
points(x=31, y=2.52, pch=4, col="black", lwd=2)
x <- seq(25,90,.1)


## Logistic Regression - Format Data


## Logistic Regression - Fit the Model
logisticReg <- glm()


## Logistic Regression - Plot the Fit
?curve
plot(oring$temp, oring$fail, pch = 20, cex = pt.size,
     xlab = "Temperature (deg F)", ylab = "O-Ring Failure")
curve(predict(logisticReg, data.frame(temp=x), type="response"), add=TRUE, col="red", lwd=2)


## Logistic Regression - Prediction
launchDay


XB <- as.numeric(coef(logisticReg)[1] + coef(logisticReg)[2]*31)
XB  # estimated log-odds of o-ring failure on launch day
exp(XB)/(1 + exp(XB))  # estimated probability of o-ring failure on launch day


## Logistic Regression - Exponentiated CIs


## Logistic Regression - Adding variables
logisticReg2 <- 


## Logistic Regression - Model Comparison via LRT

