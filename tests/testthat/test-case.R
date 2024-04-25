test_that("* case: correct usage", {
  expect_equal(case(1, 1, TRUE), TRUE)
  expect_equal(case(2, 1, TRUE, 2, FALSE), FALSE)
  expect_equal(case(T, T, "yes", F, "no", otherwise = NA), "yes")
                                        # more complicated but still correct use
})
#> Test passed

test_that("* case: sane error handling", {
  expect_equal(case(0, 1, TRUE), NULL)  # where no case is matched return NULL
  expect_true(is.na(case(0, 1, TRUE, otherwise = NA)))
                                        # specify that under no case match use NA instead of NULL
  expect_error(case(0,1)) # incorrect number of arguments
})
#> Test passed
