## These functions cache the matrix inverse produced by the solve function
## They assume the matrix is invertible

## The makeCacheMatrix function has get and set functions to assign it a matrix
## it also has getinverse and setinverse functions for getting the cached inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inv <<- solve
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The cachesolve function will run solve if getinverse is null
## otherwise it will return the cached inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  dmyata <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}

