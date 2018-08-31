
## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function( m = matrix() ) {


    i <<- NULL

    set <- function( matrix ) {
            m <<- matrix
    }


    get <- function() {

    	m
    }


    setInverse <- function(inverse) {
        i <<- inverse
    }


    getInverse <- function() {

        i
    }


    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


cacheSolve <- function(x, ...) {


    m <- x$getInverse()


    if( !is.null(m) ) {
            message("getting cached data")
            return(m)
    }


    data <- x$get()

    m <- solve(data)


    x$setInverse(m)


    m
}
