#' Prints out a menu from a character vector and waits for user selection
#'
#' @param chr_vector character vector
#' @param instruction_msg character.  Message shows under the menu selection
#' @param quit_key character.  Character value for the user to quit the menu
#' @param quit_message character.  Character value to explain how to quit the menu
#' @param return_number logical.  TRUE return number choice.  FALSE returns the index of chr_vector
#' @param test_args list(test_mode logical, test_input character).  Only use for testing.
#'
#' @return character
#' @export
#'
#' @examples
#' \dontrun{
#' console_menu(c("Eat", "sleep", "code", "repeat"))
#'
#' console_menu(
#'              c("Eat", "sleep", "code", "repeat"),
#'              "What would you like to do?",
#'              "quit",
#'              "Type quit to exit"
#'              )
#' # Example code on how the function could be used
#' user_choice <- console_menu(c("Eat", "sleep"))
#'
#' switch_result <- switch(
#'     user_choice,
#'     "1" = # code here,
#'     "2" = # code here,
#'     "q" = # exit code here
#' )
#' # Example code if the function returned the name in the character vector
#' user_choice <- console_menu(c("Eat", "sleep"), return_number = FALSE)
#'
#' switch_result <- switch(
#'     user_choice,
#'     "Eat" = # code here,
#'     "sleep" = # code here,
#'     "q" = # exit code here
#' )
#' }
console_menu <- function(chr_vector,
                         instruction_msg = "Please type in the console your choice and press enter: ",
                         quit_key = "q",
                         quit_message = paste0("To quit please type ", quit_key, " and press return"),
                         return_number = TRUE,
                         test_args = list(test_mode = FALSE, test_input = NA_character_)) {

  user_choice <- ""

  current_loop_number <- 1

  max_number_of_loops <- 50

  while(current_loop_number < max_number_of_loops) {

    print_menu(chr_vector)

    cat(quit_message, "\n", sep = "")

    if(test_args$test_mode) {

      user_choice <- test_args$test_input[current_loop_number]
      cat(instruction_msg)

    } else {

      user_choice <- readline(instruction_msg)

      }

    if(user_choice == quit_key) {

        break
    }

    if(check_choice(chr_vector, user_choice) == TRUE) {

        break
    }

    current_loop_number <- current_loop_number + 1

  }

  if(current_loop_number == max_number_of_loops) {

    stop(paste("Max number of iterations through while loop reached. Current max iterations is",
               max_number_of_loops))

  }

  if(user_choice != quit_key & return_number == FALSE) {

    user_choice <- chr_vector[as.numeric(user_choice)]

  }

  return(user_choice)

}
