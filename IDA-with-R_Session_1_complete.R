####################################################################################
#################################### SESSION 1 #####################################
############################# Author: Chris Galbraith ##############################
####################################################################################
## Vectors in R
numVec <- c(2,3,4)  # <- is the assigning operator
numVec
length(numVec)  # gives the number of elements in the vector


## Examples of Character and Logical Vectors
charVec <- c("red", "green", "blue")
charVec

logVec <- c(TRUE, FALSE, FALSE, T, F)
logVec


## Data Type Coercion
numCharVec <- c(3.14, "a")
numCharVec                 

numVec <- 1:10
numToChar <- as(numVec, "character")
numToChar


## Factors
Gender <- rep(c("Female", "Male"), times = 3)
Gender
GenderFac1 <- factor(Gender)
GenderFac1


## Matrices
myMat <- matrix(nrow = 2, ncol = 4)
myMat
length(myMat)  # gives the total number of elements in the matrix, nrow*ncol
dim(myMat)  # gives a vector containing the dimensions of the matrix, (nrow, ncol)

myMat <- matrix(nrow = 2, ncol = 4, data = 1:8)
myMat


## Other Ways to Create a Matrix
vec1 <- 1:4
vec2 <- 5:8
vec3 <- 9:12
colMat <- cbind(vec1, vec2, vec3)
colMat

rowMat <- rbind(vec1, vec2, vec3)
rowMat


## Special Values
a <- Inf
b <- 0
rslt <- c(b/a, a/a, 1/b)
rslt


## Missing Values
a <- c(1,2)
a[3]

b <- 0/0
b

vec <- c(1, NA, 3, NaN, NA, 5, NaN)
is.na(vec)
is.nan(vec)


## Reading in the Prestige Data
prestige <- read.table(file = "./data/prestige.csv", sep=",", header = TRUE, row.names=1)
class(prestige)  # gives object type
head(prestige)  # look at the first 5 rows, equivalent to prestige[1:5, ]  
dim(prestige)  # (nrow, ncol)
head(row.names(prestige))  # equivalent to row.names(prestige)[1:5]


## Subsetting Vectors
vec <- 1:10
vec[3]

vec[1:3]
vec[c(2,4,6)]


## Subsetting Data Frames
prestige[1:2, ]  # get the first 2 rows
prestige[1, 2]  # get the first row, second column


## Subsetting Data Frames, contd.
head(prestige$income)  # select the first 5 values of the second column

prestige$income[1]  # get the first element of the income vector
prestige[1, 2]  # get the first row, second column


## Logical Index Vector
logIndVec <- is.na(prestige$type)
head(logIndVec)
length(logIndVec)  # same as the number of rows in prestige
prestige[logIndVec,]


## Index Vector of Positive Integers
posIndVec <- which(is.na(prestige$type))
posIndVec  # indices of missing elements of type vector
prestige[posIndVec,]

which(logIndVec == TRUE)


## Index Vector of Character Strings
prestige[1:5, c("education", "income")]

prestige[1:5, 1:2]


## Using Index Vectors to Sort a Data Frame
sort.index <- order(prestige$education, decreasing = FALSE)
sort.index[1:5]
prestige.sorted <- prestige[sort.index, ]
prestige.sorted[1:5, ]


## Subsetting Example
ind <- which(is.na(prestige$type)) 
prestige[ind,]
rbind(index=ind, name=rownames(prestige)[ind])

ind.ch <- ind[2:4]
prestige[ind.ch, "type"] <- rep("bc", 3)
summary(prestige$type)

prestige <- na.omit(prestige)
summary(prestige$type)


## Writing Data to File
write.table(prestige, "./data/prestige_v2.csv", sep = ",", col.names = TRUE, row.names = TRUE)
