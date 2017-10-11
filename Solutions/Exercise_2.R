####################################################################################
#################################### EXERCISE 1 #################################### 
####################################################################################
### PART A - Data Input ###
# A.2
auto <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data-original")

# A.3
names(auto) <- c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr", "origin", "name")

# A.4
auto$cyl <- factor(auto$cyl)
auto$name <- as(auto$name, "character")

# A.5
head(auto)


### PART B - Missing Values ###
# B.1
missing <- which(is.na(auto), arr.ind = TRUE)
missing

# B.2
auto[missing[,1], ]


### PART C - Sorting ###
# C.1
sort.index <- order(auto$mpg, decreasing = TRUE, na.last = NA)
auto.sorted <- auto[sort.index, ]

# C.2
head(auto.sorted, 5)

# C.3
tail(auto.sorted, 5)


### PART D - String Manipulation ###
# D.1
diesel.index <- grep("diesel", auto$name)
diesel.index

# D.2 
auto$diesel <- 0
auto$diesel[diesel.index] <- 1

# D.3
auto$diesel <- factor(auto$diesel)

# D.4
str(auto)


####################################################################################
#################################### EXERCISE 2 #################################### 
####################################################################################
### PART A - Data Input ###
# A.2
summary(auto)

## B - create a histogram of the response variable (mpg)
hist(auto$mpg, col = "grey", main = "Histogram of MPG", xlab = "MPG")

## C - look at a boxplot of the response variable (mpg) grouped by number of cylinders
boxplot(mpg ~ cyl, data = auto, col = "grey",
        main = "Distribution of MPG by Number of Cylinders",
        xlab = "Cylinders", ylab = "MPG")

## D - create a scatterplot matrix including only mpg, cylinders, displacement, horsepower, 
##     weight, acceleration, and model year... what do you notice & what are the implications?
scatterplotMatrix(auto[,c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr")])

