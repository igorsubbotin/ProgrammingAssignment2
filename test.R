source("cachematrix.R")
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
h8 <- hilbert(8);
cm <- makeCacheMatrix(h8)

# cache solve
scm <- cacheSolve(cm)
scm2 <- cacheSolve(cm)
all.equal(scm, scm2)

# solve
sh8 <- solve(h8)

# is equal
all.equal(sh8, scm)