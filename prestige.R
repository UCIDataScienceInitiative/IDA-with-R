####################################################################################
## This file contains code for analyzing the Prestige data from the car package
## with an emphasis on exploratory data analysis.
####################################################################################

####################################################################################
######################## Data cleaning & preprocessing #############################
####################################################################################
## Load Data
install.packages("car", dependencies=TRUE)  # install car package
library(car)  # load car package that contains prestige data
data(Prestige) # load prestige data 
str(Prestige)  # look at the structure of the data

# ## Prestige data description
# Here we use the "Prestige" dataset from the `car` package, which has the following variables
# + education: Average education of occupational incumbents, years, in 1971.
# + income: Average income of incumbents, dollars, in 1971.
# + women: Percentage of incumbents who are women.
# + prestige: Pineo-Porter prestige score for occupation, from a social survey conducted in the mid-1960s.
# + census: Canadian Census occupational code.
# + type: Type of occupation, a factor with levels
#   + bc: Blue Collar
#   + prof: Professional, Managerial, and Technical
#   + wc: White Collar

## Summary of the data
summary(Prestige)

## Investigate NA values
Prestige[is.na(Prestige$type), ]  # look at rows with NA falues for type
ind <- which(is.na(Prestige$type))  # gives the index numbers of the NAs for type
rbind(index=ind, name=rownames(Prestige)[ind])  # print index with rowname

## Re-group & drop NA values
ind.ch <- ind[-1]  # exclude the first index for athletes
Prestige[ind.ch, "type"] <- rep("bc", 3)  # replace NAs with blue collar ("bc") 
summary(Prestige$type)  # check to see if it worked
Prestige <- na.omit(Prestige)  # exclude any rows with NAs (one row here for athletes)
summary(Prestige$type)

####################################################################################
################## Exploratory Data Analysis (EDA) #################################
####################################################################################
## Histogram of Response Variable
hist(Prestige$prestige, col = "grey", main = "Histogram of Prestige Score", xlab = "Prestige Score")

## Scatterplot of response vs covariate
plot(Prestige$education, Prestige$prestige,
     main = "Prestige Score by Education",
     xlab = "Ave. Years of Education", ylab = "Prestige Score")

## Add in linear fit & smoother fit 
plot(Prestige$education, Prestige$prestige,
     main = "Prestige Score by Education",
     xlab = "Avg Years of Education", ylab = "Prestige Score")
abline(reg = lm(prestige ~ education, data = Prestige), col = "red", lwd = 2)
lines(lowess(Prestige$education, Prestige$prestige), col = "blue", lty = 2, lwd = 2)
legend("topleft",legend = c("Regression Line", "Smoother"), col = c("red","blue"),
       lwd = c(2,2), lty = c(1,2), bty = "n")

## Scatterplot Matrix
# Use direct ordering of the varaibles to control how they are plotted
scatterplotMatrix(Prestige[,c("prestige","education","income","women")])

## Boxplot of respose by categorical variable
boxplot(prestige ~ type, data = Prestige, col = "grey",
        main = "Distribution of Prestige Score by Type of Occupation",
        xlab = "Occupation Types", ylab = "Prestige Score")

####################################################################################
##################### Modeling - Linear Regression #################################
####################################################################################
## Fit the Model
myReg <- lm(prestige ~ education + income + women, data = Prestige)
myReg
names(myReg)

## Summary of Fit
summary(myReg)

## "summary" Contents
sum.myReg = summary(myReg)
names(sum.myReg)  # show different contents
names(myReg)  # this is what we had previously

## Confidence Intervals
confint(myReg, 'income', level=0.95)  # 95% CI for coefficient of 'income'
confint(myReg, level=0.95)  # 95% CI for all coefficients

## Adding Variables
mod = update(myReg, ~ . + type)  # add in type of occupation
summary(mod) 

##  Relevel a Factor
levels(Prestige$type)
Prestige$type = relevel(Prestige$type, "prof")
levels(Prestige$type)
mod = update(myReg, ~ . + type)
summary(mod)

## Diagnostics
par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
plot(myReg)

## Predict the output for a new input
newData = data.frame(education=13.2, income=12000, women=12)
predict(myReg, newData, interval="predict")  # point estimate & 95% CI

