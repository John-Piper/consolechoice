#' Prints out a menu from a list of file names in a folder for user selection
#'
#' wrapper function to console_menu.
#'
#' @param folder_path character.
#' @param pattern character. Regex pattern used in list.files.
#' @param instruction_msg character.  Message shows under the menu selection.
#' @param quit_key character.  Character value for the user to quit the menu.
#' @param quit_message character.  Character value to explain how to quit the menu.
#' @param return_number logical.  TRUE return number choice.  FALSE returns the index of chr_vector.
#' @param test_args list(test_mode logical, test_input character).  Only use for testing.
#'
#' @return character
#' @export
#'
#' @examples
#' \dontrun{
#' console_file_menu("/folder/path/with/files")
#'
#' console_file_menu("/folder/path/with/files",
#'                   ".bmp",
#'                   instruction_msg = "Please select a file to open")
#'
#' console_file_menu(folder_path = "/folder/path/with/files",
#'                  pattern = "example_doc",
#'                  instruction_msg = "Choose a excel file to open",
#'                  quit_key = "Q",
#'                  quit_message = "Type in Q and press return to quit",
#'                  return_number = TRUE)
#'
#' # Example code on how the function could be used
#' user_choice <- console_file_menu("/folder/path/", ".doc")
#'
#' switch_result <- switch(
#'     user_choice,
#'     "document_one.doc" = # code here,
#'     "document_two.doc" = # code here,
#'     "q" = # exit code here
#' )
#' # Example code if the function returned the number in the list
#' user_choice <- console_file_menu("/folder/path/", ".doc", return_number = FALSE)
#'
#' switch_result <- switch(
#'     user_choice,
#'     "1" = # code here,
#'     "2" = # code here,
#'     "q" = # exit code here
#' )
#' }
console_file_menu <- function(folder_path = ".",
                              pattern = NULL,
                              instruction_msg = "Type the number in the console your choice and press enter: ",
                              quit_key = "q",
                              quit_message = paste0("To quit please type ", quit_key, " and press return"),
                              return_number = FALSE,
                              test_args = list(test_mode = FALSE, test_input = NA_character_)) {

  if (class(folder_path) != "character") {

    stop("Error: A non character argument used for the folder path.")

  }

  list_of_files <- list.files(path = folder_path, pattern = pattern)

  if (length(list_of_files) == 0) {

    stop("Error: No file names were found in the folder path and pattern provided.")

  }

  return_value <- console_menu(
    chr_vector = list_of_files,
    instruction_msg = instruction_msg,
    quit_key = quit_key,
    quit_message = quit_message,
    return_number = return_number,
    test_args = test_args)

}
