####################################################################################
### SESSION 1 - Shell code from slides
####################################################################################
## Vectors in R



## Examples of Character and Logical Vectors



## Data Type Coercion



## Factors



## Matrices
myMat <- matrix(nrow = 2, ncol = 4)


myMat <- matrix(nrow = 2, ncol = 4, data = 1:8)



## Other Ways to Create a Matrix
vec1 <- 1:4
vec2 <- 5:8
vec3 <- 9:12
colMat <-
  
rowMat <- 


## Special Values
a <- Inf
b <- 0


## Missing Values


vec <- c(1, NA, 3, NaN, NA, 5, NaN)


## Reading in the Prestige Data
path <- here::here("data", "prestige.csv")
prestige <- read.table(file = path, 
                       sep=",", 
                       header = TRUE, 
                       row.names=1)



## Subsetting Vectors
vec <- 1:10


## Subsetting Data Frames



## Subsetting Data Frames, contd.



## Logical Index Vector
logIndVec <- is.na(prestige$type)


## Index Vector of Positive Integers
posIndVec <-


## Index Vector of Character Strings
prestige[1:5, c("education", "income")]


## Using Index Vectors to Sort a Data Frame
sort.index <- order(prestige$education, decreasing = FALSE)

prestige.sorted <- 


## Subsetting Example


## Writing Data to File
path2 <- here::here("data", "prestige_v2.csv")
write.table()
