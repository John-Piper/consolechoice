library("consolechoice")


# setup

test_folder_path <- "folder_files_for_tests"

test_pattern_for_txt_files <- ".txt"

test_pattern_for_bmp_files <- ".bmp"

test_pattern_for_no_files <- ".html"

test_args_select_one <- list(test_mode = TRUE, test_input = "1")

test_args_select_two <- list(test_mode = TRUE, test_input = "2")

test_error_msg <- "No file names were found in the folder path and pattern provided."

expected_menu_message <- paste0("1: example_doc_one.txt\\n2: example_doc_two.txt\\nTo quit please type q and press return\\n",
                          "Please type in the console your choice from above and press enter: ")


# tests

test_that("return the first text file in the menu", {
  expect_equal(console_file_menu(
    test_folder_path,
    test_pattern_for_txt_files,
    test_args = test_args_select_one
  ), "example_doc_one.txt")
})

test_that("return the first bmp file in the menu", {
  expect_equal(console_file_menu(
    test_folder_path,
    test_pattern_for_bmp_files,
    test_args = test_args_select_two
  ), "example_image_two.bmp")
})

test_that("expect menu message from inputs", {
  expect_output(console_file_menu(
    test_folder_path,
    test_pattern_for_txt_files,
    test_args = test_args_select_two
  ), expected_menu_message)
})

test_that("returns the second choice as a number character", {
  expect_equal(console_file_menu(
    test_folder_path,
    test_pattern_for_txt_files,
    return_number = TRUE,
    test_args = test_args_select_two
  ), "2")
})

test_that("Expect error message as no files found in folder with pattern", {
  expect_error(console_file_menu(
    test_folder_path,
    test_pattern_for_no_files,
    test_args = test_args_select_one
  ), test_error_msg)
})
