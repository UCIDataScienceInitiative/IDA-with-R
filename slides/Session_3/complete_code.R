####################################################################################
### SESSION 3 - Complete code from slides
### Author: Chris Galbraith 
####################################################################################
## Standard Normal Distribution
str(dnorm) # normal pdf
dnorm(x = 0, mean = 0, sd = 1)

x <- seq(from = -3, to = 3, by = 0.05)
y <- dnorm(x, mean = 0, sd = 1)
plot(x, y, type = "l", ylab = "Density")

str(rnorm) # generate random number from normal dist
rnorm(10, mean = 0, sd = 1)

str(pnorm) # normal CDF
pnorm(0, mean = 0, sd = 1) # Pr[X <= 0] = ?

str(qnorm) # normal quantile func
qnorm(0.975, mean = 0, sd = 1) # PR[X <= ?] = 0.975


##  One-Sample T-Test (Create Data)
set.seed(123)
oneSampData <- rnorm(100, mean = 0, sd = 1)
mean(oneSampData)
sd(oneSampData)


##  One-Sample T-Test ($H_0: \mu = 0$)
oneSampTest.0 <- t.test(oneSampData) 
oneSampTest.0
names(oneSampTest.0) 
oneSampTest.0$statistic
oneSampTest.0$estimate


##  One-Sample T-Test ($H_0: \mu = a$)
a <- 0.3
oneSampTest.mu <- t.test(oneSampData, mu = a)
oneSampTest.mu


##  Two-Sample T-Test (Create & Plot Data)
Samp1 <- rnorm(300, mean = 2.5, sd = 1)
Samp2 <- rnorm(500, mean = 3.0, sd = 1) # notice: not the same sample size
plot(density(Samp1), col="red", main="Densities of Samp1 and Samp2", xlab="")
abline(v = mean(Samp1), col = "red", lwd = 2, lty=2)
lines(density(Samp2), col="blue")
abline(v = mean(Samp2), col = "blue", lwd = 2, lty = 2)
legend("topright", legend = c("Samp1", "Samp2"),
       fill = c("red","blue"), bty = "n", cex = 1.3)


##  Two-Sample T-Test (Un-equal Variances)
t.test(Samp1, Samp2)  # default assump: unequal variances


##  Two-Sample T-Test (Equal Variances)
t.test(Samp1, Samp2, var.equal = TRUE)  # default assump: unequal variances


##  Two-Sample T-Test (Paired T-Test)
t.test(Samp1, Samp2[1:300], paired = TRUE) # must be of the same sample size


## Load Data
prestige <- read.csv(file = here::here("data", "prestige_v2.csv"),
                     row.names=1)
str(prestige)
head(prestige)


## Another look at the scatterplot matrix
library(car)
scatterplotMatrix(prestige[,c("prestige","education","income","women")])


## Linear Regression - Fit the Model
myReg <- lm(prestige ~ education + income + women, data = prestige)
myReg
names(myReg)


##  Linear Regression - Summary Contents
summary(myReg)
myReg.summary <- summary(myReg)
names(myReg.summary) # show different contents
names(myReg) # this is what we had previously


##  Linear Regression - Confidence Intervals
confint(myReg, 'income', level=0.95)

confint(myReg, level=0.95)


##  Linear Regression - Adding Variables
boxplot(prestige ~ type, data = Prestige, col = "grey",
main = "Distribution of Prestige Score by Types",
xlab = "Occupation Types", ylab = "Prestige Score")

mod <- update(myReg, ~ . + type)
summary(mod)


##  Linear Regression - Comparing Models
formula(myReg)
formula(mod)

anova(myReg, mod)


##  Linear Regression - Relevel a Factor
levels(prestige$type)
prestige$type <- relevel(prestige$type, "prof")
levels(prestige$type)

mod <- update(myReg, ~ . + type)
summary(mod)


## Linear Regression - Stepwise Regression
null <- lm(prestige ~ 1, data=prestige)  # most basic model, intercept only
full <- lm(prestige ~ education + income + women + type, data=prestige)  # saturated model, all predictors
step(null, scope=list(lower=null, upper=full), direction='forward')
step(full, scope=list(lower=null, upper=full), direction='backward')
step(null, scope=list(lower=null, upper=full), direction='both')


## Linear Regression - Best Subsets Regression
if (!require("leaps")) install.packages("leaps")  # install leaps if it isn't already
library(leaps)
bestSubsets <- regsubsets(prestige ~ education + income + women + type, data=prestige, nbest=1)
summary(bestSubsets)
par(mfrow=c(1,2))
plot(bestSubsets, scale="adjr2"); plot(bestSubsets, scale="Cp")


##  Linear Regression - Diagnostics
par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
plot(myReg)


##  Linear Regression - Prediction
newData = data.frame(education=13.2, income=12000, women=12)
predict(myReg, newData, interval="predict")
