library("consolechoice")

# Set up

character_vector_input <- c("Item one", "Item two")

expected_output <- "1: Item one\\n2: Item two"


# Tests

test_that("Expect a numbered menu list printed from a character vector with no instruction message", {
  expect_output(print_menu(character_vector_input), expected_output)
})

test_that("The program to stop when an empty vecotr is used", {
  expect_error(print_menu(c(), "The Character vector length must be greater than one."))
})
