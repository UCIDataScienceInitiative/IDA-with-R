####################################################################################
## This file contains code for analyzing the Auto MPG data from the UCI Machine
## Learning Repository with an emphasis on data preptocessing, EDA & linear models.
## URL: https://archive.ics.uci.edu/ml/datasets/Auto+MPG
####################################################################################
library(car)
####################################################################################
######################## Data cleaning & preprocessing #############################
####################################################################################
## Load Data
auto <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data-original")
head(auto)
names(auto) <- c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr", "origin", "name")
head(auto)
str(auto)

## Summary of the data
summary(auto)

## Investigate NAs
auto[is.na(auto$mpg), ]  # mpg is the response; predict these after fitting models
auto[is.na(auto$hp), ]  # hp is a covariate; need to see i fthere is a relationship with mpg

####################################################################################
################## Exploratory Data Analysis (EDA) #################################
####################################################################################
## Histogram of Response Variable
hist(auto$mpg, col = "grey", main = "Histogram of MPG", xlab = "MPG")

## Scatterplot of response vs covariate
plot(auto$weight, auto$mpg, pch = 20,
     main = "MPG by Weight",
     xlab = "Weight (lbs)", ylab = "MPG")

## Scatterplot Matrix
scatterplotMatrix(auto[,c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr")])



