## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
library(MASS)

makeCacheMatrix <- function(x = matrix(), tol = sqrt(.Machine$double.eps)) {
  m <- NULL
  set <- function (y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  ## set_inv_mat <- function (solve) m <<- solve
  set_inv_mat <- function (ginv) m <<- ginv
  get_inv_mat <- function () m
  list(set = set, get = get, set_inv_mat = set_inv_mat, get_inv_mat = get_inv_mat)
}


## Write a short comment describing this function

cacheSolve <- function(x = matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
        ## temp <- as.data.frame(get_inv_mat)
        m <- x$get_inv_mat()
        ## m <- x$temp()
        if(!is.null(m)) {
          message ("Getting cashed data for matrix...")
          return (m)
        }
        else {
        mtrx <- x$get()
        ## m <- solve(mtrx) %*% mtrx
        m <- ginv(mtrx) %*% mtrx
        x$set_inv_mat(mtrx)
        m
        }
}
