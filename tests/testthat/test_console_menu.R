library("consolechoice")


# setup

test_chr_vector <- c("Eat", "Sleep", "Test", "Repeat")

test_args_quit <- list(test_mode = TRUE, test_input = "q")

test_args_selection_three <- list(test_mode = TRUE, test_input = c("3"))

test_args_correct_seltion_after_5_attempts <- list(test_mode = TRUE, test_input = c("5", "6", "7", "8", "9", "2"))

test_args_for_error_msg <- list(test_mode = TRUE, test_input = rep("this will fail", 101))

expected_error_message <- "Max number of iterations through while loop reached. Current max iterations is 50"

test_instruction_msg <- "Choose above please"

test_quit_key <- "quit"

test_quit_message <- "Type in quit to quit"

expected_menu_message <- "1: Eat\\n2: Sleep\\n3: Test\\n4: Repeat\\nType in quit to quit\\nChoose above please"


# tests

test_that("Menu message changes when passing in new arguments for instrution_msg", {
  expect_output(console_menu(chr_vector = test_chr_vector,
                              instruction_msg = test_instruction_msg,
                              quit_key = test_quit_key,
                              quit_message = test_quit_message,
                              return_number = TRUE,
                              test_arg = list(test_mode = TRUE, test_input = "quit")), expected_menu_message)
})

test_that("Quit using a new quit key", {
  expect_equal(console_menu(chr_vector = test_chr_vector,
                             instruction_msg = test_instruction_msg,
                             quit_key = test_quit_key,
                             quit_message = test_quit_message,
                             return_number = TRUE,
                             test_arg = list(test_mode = TRUE, test_input = "quit")), "quit")
})

test_that("The return value is the default quit_key", {
  expect_equal(console_menu(test_chr_vector, test_args = test_args_quit), "q")
})

test_that("The return value is the first choice as a character number", {
  expect_equal(console_menu(test_chr_vector, test_args = test_args_selection_three), "3")
})

test_that("Characte value returned from the menu", {
  expect_equal(console_menu(test_chr_vector, return_number = FALSE, test_args = test_args_selection_three), "Test")
})

test_that("Two will be returned after 5 attemps", {
  expect_equal(console_menu(test_chr_vector, test_args = test_args_correct_seltion_after_5_attempts), "2")
})

test_that("100 incorrect answers will show a stop message", {
  expect_error(console_menu(test_chr_vector, test_args = test_args_for_error_msg), expected_error_message)
})
