# Computational benchmarking suite

# ── scheme handlers ────────────────────────────────────────────────────────────

#' Computation benchmarking
#'
#' @param scheme  One of "large", "medium" or "small" describing the scale of
#'                the benchmark. This scales the number of tests as well as the
#'                amount of data used in some of them.
#' @param ...     Provide additional arbitrary functions to test
#'
bench <- function(scheme, ...) {


  # initial example
  r <- 10000
  p <- 100
  X <- matrix(rnorm(r*p), r, p)
  y <- X %*% rnorm(p) + rnorm(100)

  microbenchmark::microbenchmark(
     "lm"            = { b <- lm(y ~ X + 0)$coef },
     "pseudoinverse" = { b <- solve(t(X) %*% X) %*% t(X) %*% y },
     "linear system" = { b <- solve(t(X) %*% X, t(X) %*% y) },
     times           = n
  )
}


schemes <- list( small  = NA
               , medium = NA
               , large  = NA
               )
# ── function specifications ────────────────────────────────────────────────────

#' A simple linear regression benchmark
#, config'
#'
#' Benchmarking a simple linear regression using lm()
#'
#' @param data a matrix which is of different sizes for different schemes
bench_lm <- function(data) {
  r <-
}
