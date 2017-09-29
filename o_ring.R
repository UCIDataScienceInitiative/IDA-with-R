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
