library("consolechoice")


test_vector <- c("a", "b", "c")


test_that("Returns TRUE when the choice argument is between 1 and the length of the vector", {
  expect_true(check_choice(test_vector, 2))
})

test_that("Returns TRUE when the choice argument is the length of the vector", {
  expect_true(check_choice(test_vector, length(test_vector)))
})

test_that("Returns FALSE when the choice argument is not between 1 and the length of the vector", {
  expect_false(check_choice(test_vector, 4))
})

test_that("Returns FALSE when the choice argument is 0", {
  expect_false(check_choice(test_vector, 0))
})

test_that("Returns FALSE when a non numeric value is entered", {
  expect_false(check_choice(test_vector, "Not a number"))
})

test_that("expect an error if the vector is length 0",{
  expect_error(check_choice(c(), 1), "Error: The character vector length requirs to be one or greate than one.")
})

test_that("expect an error if the vector is not a character",{
  expect_error(check_choice(c(1,2,3), 1), "Error: A non character vector was passed as an argument.")
})

test_that("expect an error if a list has been used instead of a vector",{
  expect_error(check_choice(list(1, "a"), 1), "Error: A list was used in the argument.  Only a character vector can be used.")
})


