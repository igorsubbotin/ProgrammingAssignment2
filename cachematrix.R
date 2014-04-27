# Make matrix that could cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL # init inverse internal object with NULL
  set <- function(y) { # set internal matrix
    x <<- y
    inv <<- NULL
  }
  get <- function() x # get internal matrix
  setinverse <- function(inv) i <<- inv # set cache object
  getinverse <- function() i # get cache object
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse) # setup internal properties
}


# Inverse matrix (load from cache if inverse already solved)
# x: makeCacheMatrix object
cacheSolve <- function(x, ...) {
  i <- x$getinverse() # try to load inverse from cache
  if (!is.null(i)) { # check if object loaded from cache
    message("getting cached data")
    return(i) # return a matrix that is the inverse of 'x' that was loaded from cache
  }
  data <- x$get() # get internal matrix object
  i <- solve(data) # inverse matrix
  x$setinverse(i) # set inverse result to cache
  i # return a matrix that is the inverse of 'x' that was calculated
}