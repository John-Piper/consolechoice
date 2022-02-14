library("consolechoice")

# setup

test_args_quit <- list(test_mode = TRUE, test_value = "q")

test_args_selection_one <- list(test_mode = TRUE, test_value = c("1"))

test_chr_vector <- c("Eat", "Sleep", "Test", "Repeat")


# tests

test_that("The return value is the default quit_key", {
  expect_equal(console_menu(test_chr_vector, test_args = test_args_quit), "q")
})

test_that("The return value is the first choice as a character number", {
  expect_equal(console_menu(test_chr_vector, test_args = test_args_selection_one), "1")
})
