####################################################################################
### SESSION 3 - Shell code from slides
####################################################################################
## Standard Normal Distribution
str(dnorm) # normal pdf
dnorm()

x <- seq(from = -3, to = 3, by = 0.05)
y <- 


str(rnorm) # generate random number from normal dist


str(pnorm) # normal CDF
 # Pr[X <= 0] = ?

str(qnorm) # normal quantile func
 # PR[X <= ?] = 0.975


##  One-Sample T-Test (Create Data)
set.seed(123)
oneSampData <- rnorm(100, mean = 0, sd = 1)



##  One-Sample T-Test ($H_0: \mu = 0$)
oneSampTest.0 <- t.test(oneSampData) 


##  One-Sample T-Test ($H_0: \mu = a$)
a <- 0.3
oneSampTest.mu <- t.test(oneSampData, mu = a)


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


##  Two-Sample T-Test (Equal Variances)


##  Two-Sample T-Test (Paired T-Test)


## Load Data
prestige <- read.csv(file = here::here("data", "prestige_v2.csv"),
                     row.names=1)
str(prestige)
head(prestige)


## Another look at the scatterplot matrix
library(car)
scatterplotMatrix(prestige[,c("prestige","education","income","women")])


## Linear Regression - Fit the Model
myReg <- lm()


##  Linear Regression - Summary Contents
summary(myReg)


##  Linear Regression - Confidence Intervals
?confint
confint(myReg, parm='income', level=0.95)


##  Linear Regression - Adding Variables
boxplot(prestige ~ type, data = Prestige, col = "grey",
main = "Distribution of Prestige Score by Types",
xlab = "Occupation Types", ylab = "Prestige Score")

mod <- update()


##  Linear Regression - Comparing Models
formula(myReg)
formula(mod)



##  Linear Regression - Relevel a Factor
levels(prestige$type)
prestige$type <- 

mod <- update(myReg, ~ . + type)
summary(mod)


## Linear Regression - Stepwise Regression
null <- lm()  # most basic model, intercept only
full <- lm()  # saturated model, all predictors
step(null, scope=list(lower=null, upper=full), direction='forward')



## Linear Regression - Best Subsets Regression
if (!require("leaps")) install.packages("leaps")  # install leaps if it isn't already
library(leaps)
bestSubsets <- regsubsets(prestige ~ education + income + women + type, data=prestige, nbest=1)
summary(bestSubsets)
par(mfrow=c(1,2))
plot(bestSubsets, scale="adjr2")
plot(bestSubsets, scale="Cp")


##  Linear Regression - Diagnostics
par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
plot(myReg)


##  Linear Regression - Prediction
newData <- data.frame(education=13.2, income=12000, women=12)

