#' Prints out a menu from a list of file names in a folder for user selection
#' wrapper function to console_menu
#'
#' @param folder_path character
#' @param pattern character. Regex pattern used in list.files
#' @param instruction_msg character.  Message shows under the menu selection
#' @param quit_key character.  Character value for the user to quit the menu
#' @param quit_message character.  Character value to explain how to quit the menu
#' @param return_number logical.  TRUE return number choice.  FALSE returns the index of chr_vector
#' @param test_args list(test_mode logical, test_input character).  Only use for testing.
#'
#' @return character
#'
#' @examples
#'
#' console_file_menu("c/", ".txt")
#'
#' console_file_menu("c/", ".txt", instruction_msg = "Please select a file to open")
#'
#' console_file_menu(
#'                  folder_path = "c/",
#'                  pattern = "xlsm",
#'                  instruction_msg = "Choose a excel file to open",
#'                  quit_key = "Q",
#'                  quit_message = "Type in Q and press return to quit",
#'                  return_number = TRUE
#'                  )
console_file_menu <- function(folder_path = ".",
                              pattern = NULL,
                              instruction_msg = "Please type in the console your choice and press enter: ",
                              quit_key = "q",
                              quit_message = paste0("To quit please type ", quit_key, " and press return"),
                              return_number = FALSE,
                              test_args = list(test_mode = FALSE, test_input = NA_character_)) {

  list_of_files <- list.files(path = folder_path, pattern = pattern)

  if(length(list_of_files) == 0) {

    stop("No file names were found in the folder path and pattern provided.")

  }

  return_value <- console_menu(
    chr_vector = list_of_files,
    instruction_msg = instruction_msg,
    quit_key = quit_key,
    quit_message = quit_message,
    return_number = return_number,
    test_args = test_args
  )

  return(return_value)

}
