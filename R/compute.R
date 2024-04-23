#' Computation profiling
#'
#' @param n   The number of times to perform the benchmark
#' @param ... Provide additional arbitrary functions to test
#'
compbench <- function(n = 100, ...) {
  # initial example
  r <- 10000
  p <- 100
  X <- matrix(rnorm(r*p), r, p)
  Y <- X %*% rnorm(p) + rnorm(100)

  microbenchmark::microbenchmark(
     "lm"            = { b <- lm(y ~ X + 0)$coef },
     "pseudoinverse" = { b <- solve(t(X) %*% X) %*% t(X) %*% y },
     "linear system" = { b <- solve(t(X) %*% X, t(X) %*% y) },
     times           = n
  )
}
