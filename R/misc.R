# Miscellaneous functions provided to support the exported functions
#+NOTE: none of these functions are exported

#' Writing a fixed width bar
#, config'
#'
#' Return either a solid horizontal box character or specified text surrounded
#' by horizontal box characters for a specified width.
#'
#' @param content  extra text to include in the bar
#' @param width    how far to draw the line
#' @examples
#' create_bar()  # write just a bar
#' create_bar("Content in here")
create_bar <- function(content = NULL, width = 80) {
  c <- if (is.null(content)) "" else paste0(" ", content, " ")
  gap <- nchar(c)

  if (gap >= width) return(c)
  else return(paste(c("──", c, rep("─", width - gap - 4)), collapse = ''))
}


#' A `case`-like function for R
#, config'
#'
#' Given a condition, evaluate cases and return the requested value for the
#' first condition to be satisfied. If no case matches, return `NULL`
#'
#' @param otherwise the return value in the case that no condition matches
#' @param ... arguments to be passed to the function
case <- function(..., otherwise = NULL) {
  dots <- eval(substitute(alist(...)), envir = parent.frame())

  conditional <- eval(dots[[1]], envir = parent.frame())

  if (length(dots) %% 2 != 1)
    stop("ERROR: case must take an odd number of terms.")

  for (condition in seq(2, length(dots), by = 2)) {
    if (identical(eval(dots[[condition]], envir = parent.frame()), conditional))
      return(eval(dots[[condition + 1]], envir = parent.frame()))
  }

  otherwise
}
