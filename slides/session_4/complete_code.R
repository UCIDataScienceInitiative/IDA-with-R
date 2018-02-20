####################################################################################
### SESSION 4 - Complete code from slides
### Author: Chris Galbraith 
####################################################################################
## O-Ring Data
oring <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/space-shuttle/o-ring-erosion-only.data")
names(oring) <- c("n_risk", "n_fail", "temp", "psi", "order")
head(oring)
summary(oring)


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
linearReg <- lm(n_fail ~ temp, data = oring)
summary(linearReg)


## Naive Analysis Results - Predict for launch day
launchDay <- data.frame(temp = 31)
predict(linearReg, launchDay, interval="predict")  # point estimate & 95% CI


## Naive Analysis Results - Plot the fit extrapolating to launch day
plot(oring$temp, oring$n_fail, pch = 20, cex = pt.size/2, 
     xlab = "Temperature (deg F)", ylab = "Num O-Ring Failures",
     xlim = c(30, 85), ylim = c(0, 5))
abline(reg = linearReg, col = "red", lwd = 2)
points(x=31, y=2.52, pch=4, col="black", lwd=2)
x <- seq(25,90,.1)
pred <- predict(linearReg, data.frame(temp=x), interval="predict")
lines(x, pred[,2], lty=2, col="red")
lines(x, pred[,3], lty=2, col="red")


## Logistic Regression - Format Data
oring$fail <- as.numeric(oring$n_fail > 0)
head(oring)

plot(oring$temp, oring$fail, pch = 20, cex = pt.size,
     xlab = "Temperature (deg F)", ylab = "O-Ring Failure")


## Logistic Regression - Fit the Model
logisticReg <- glm(fail ~ temp, data = oring, family=binomial(link="logit"))
summary(logisticReg)
names(logisticReg)


## Logistic Regression - Plot the Fit
plot(oring$temp, oring$fail, pch = 20, cex = pt.size,
     xlab = "Temperature (deg F)", ylab = "O-Ring Failure")
curve(predict(logisticReg, data.frame(temp=x), type="response"), add=TRUE, col="red", lwd=2)


## Logistic Regression - Prediction
launchDay
predict(logisticReg, launchDay, type="response")

XB <- as.numeric(coef(logisticReg)[1] + coef(logisticReg)[2]*31)
XB  # estimated log-odds of o-ring failure on launch day
exp(XB)/(1 + exp(XB))  # estimated probability of o-ring failure on launch day


## Logistic Regression - Exponentiated CIs
exp(confint(logisticReg, "temp", level=0.95))  # profile likelihood method

exp(confint.default(logisticReg, "temp", level=0.95))  # Wald CI


## Logistic Regression - Adding variables
logisticReg2 = update(logisticReg, . ~ . + psi, data=oring)
summary(logisticReg2)


## Logistic Regression - Model Comparison via LRT
anova(logisticReg, logisticReg2, test='LRT')

