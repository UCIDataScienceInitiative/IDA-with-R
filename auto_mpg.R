####################################################################################
## This file contains code for analyzing the Auto MPG data from the UCI Machine
## Learning Repository with an emphasis on data preptocessing, EDA & linear models.
## URL: https://archive.ics.uci.edu/ml/datasets/Auto+MPG
####################################################################################

####################################################################################
######################## Data cleaning & preprocessing #############################
####################################################################################
## Load Data
auto <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data")
head(auto)
names(auto) <- c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr", "origin", "name")
head(auto)
