## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a matrix, sets values for it and its inverse, creates getters and setters methods
## Finally, the funcitron cretes a list of the getters and setters

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
        get <- function () x
        setinverse <- function(inverse) inv <<- inverse       
        getinverse <- function () inv
        list(set = set, get = get, 
             setinverse = setinverse,
             getinverse = getinverse)
}

## Write a short comment describing this function
## THis function checks for a cached inverse of the matrix and returns it or if needed calculates a new onw

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data) %*% data # had to look up from R solve funciton use
        x$setinverse(inv)
        inv
}
