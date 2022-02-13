library("consolechoice")

# Set up

character_vector_input <- c("Item one", "Item two")

expected_output_from_character_vector_no_instruction_msg <- "\\[1\\] \"1: Item one\"\n\\[1\\] \"2: Item two\""


# Tests

test_that("Expect a numbered menu list printed from a character vector with no instruction message", {
  expect_output(print_menu(character_vector_input), expected_output_from_character_vector_no_instruction_msg)
})

test_that("The program to stop when an empty vecotr is used", {
  expect_error(print_menu(c(), "The Character vector length must be greater than one."))
})
