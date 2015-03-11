## Caching the Inverse of a Matrix

# makeCacheMatrix function creates a list of functions to:
# set the value of the matrix
# get the value of the matrix
# set the value of inverse of the matrix
# get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

    INV <- NULL   # storage for inverse of the matrix
    
    set <- function(y) { # set the value of the matrix
        x <<- y
        inv <<- NULL
    }
    get <- function() { x } # get the value of the matrix
    
    # set the value of inverse of the matrix
    setInverse <- function(inverse) { INV <<- inverse  }
    
    # get the value of inverse of the matrix
    getInverse <- function() { INV }
    
    # return a list of functions
    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


# This function returns the inverse of the matrix
# In first run, we make the inverse, sets one in the cache
# If the inverse has already been computed, we return cached value

cacheSolve <- function(x, ...) {

    INV <- x$getInverse()  # try to get inverse matrix
    
    if(!is.null(INV)) 
    {
        # if cashed inverse matrix exists, return cashed one
        message("getting cached data")
        return(INV)
    }
    else
    {                      # else:
        data <- x$get()    # get matrix
        INV <- solve(data) # solve it 
        x$setInverse(INV)  # remember solution
        return(INV)        # and return it
    }
}

############################
############################

## Check the solution:

## Take the matrix 4 by 4, that have a simple solution:
#v1 = c(1,3,-5,7)
#v2 = c(0,1,2,-3)
#v3 = c(0,0,1,2)
#v4 = c(0,0,0,1)
#M = rbind(v1,v2,v3,v4)

#mc = makeCacheMatrix(M)
#mc$get()

## First run (without cache)
#cacheSolve(mc)

## Second run (with cache)
#cacheSolve(mc)



