
## vectors
x <- seq(from=1 , to=100, by = 2)
x

# matrix
y <- 1:10
class(y)
dim(y) <- c(5,2)
class(y)
y

z <- matrix(1:10, 2, 5)# this is by col numbers are arranged
# to acces particlur element here is the formula
# matrix name [row, col]

z
z[1,]
z[2,3]# to access pertular elemet
z1 <- matrix(1:10, 2, 5, byrow = T)# this is by row numbers are arranged
z1

# array
x1 <- array(1:100, dim = c(5,5,4))
# To access particluar element 
# to acces particlur element here is the formula
# array name [row, col, matrix] the above array is divided into 4 matrix 
# and each matrix has 5 rows and 4 columns ]
x1
x1[5,5,4]
class(x1[1,,])

# where as vector, array matrix are elements of same type
# nothing but if vector/array/marix should form in integer it be given integer number
# and it will accept the same other wise it will through an error


#Lists
# lists can be elements of different type
x2 <- c("Amma", "Manju", "varnitha", "anna", "athge")
y2 <- c(5,2,6,5,3.4)
z2 <- c(1,5,4)
M1 <- list(x2, y2, z2)
M1
# To access the elements here is the formula
class(M1)
M1[[1]]
M1[[2]]
M1[[3]]
M1[[x2[1]]]


### factor varibale and reordering 
A1 <- c("okay", "Notokay", "Absolute okay", "okay", "okay")
A1
class(A1)
A1_fact <- factor(A1)
A1_fact
str(A1_fact)

#notokay - 1
#okay - 2
#Absolutelyokay - 3
order(factor(A1_fact, levels = c("Notokay", "okay", "Absolute okay")))
?order


