## Put comments here that give an overall description of what your
## functions do

## The first function creats a list of functions to 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the matrix inversion
## 4. get the value of the matrix inversion

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL}
  get <- function() x
  setinversion <- function(inversion) m <<- inversion
  getinversion <- function() m
  list(set = set, get = get, 
       setinversion = setinversion, 
       getinversion = getinversion)
}


## The following function calculates the inversion
## of matrix with the above funciton.
## If the inversion has been calculated,
## it gets the inversion from the cahce and skips the computation
## Otherwise, it wll calculates the inverison and store it in the cache

cacheSolve <- function(x, ...) {
  m <- x$getinversion()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinversion(m)
        ## Return a matrix that is the inverse of 'x'
}
