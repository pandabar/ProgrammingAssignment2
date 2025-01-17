# These functions calculate and cache a matrix and its
# inverted matrix

## makeCacheMatrix creates a list of functions to 
## cache a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
  seti <- function(y) {
    x <<- y
    inv <<- NULL
  }
  geti <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(seti = seti, geti = geti,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve checks for stored values and returns the inv matrix

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
if(!is.null(inv)) {
  message("bleep bleep... perusing the depths of my database...")
  return(inv)
}
datai <- x$geti()
inv <- solve(datai, ...)
x$setinv(inv)
inv
}
