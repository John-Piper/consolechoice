#' Prints out a menu from a character vector and waits for user selection
#'
#' @param chr_vector character vector
#' @param instruction_msg character.  Message shows under the menu selection
#' @param quit_key character.  Character value for the user to quit the menu
#' @param quit_message character.  Character value to explain how to quit the menu
#' @param return_number logical.  TRUE return number choice.  FALSE returns the index of chr_vector
#' @param test_args list(test_mode logical, test_value character).  Only use for testing.
#'
#' @return character
#'
#' @examples
#'
#' console_menu(c("Eat", "sleep", "code", "repeat"))
#'
#' console_menu(c("Eat", "sleep", "code", "repeat"), "What would you like to do?", "quit", "Type quit to exit")
console_menu <- function(chr_vector,
                         instruction_msg = "Please type in the console your choice from above and press enter: ",
                         quit_key = "q",
                         quit_message = paste0("To quit please type ", quit_key, " and press return"),
                         return_number = TRUE,
                         test_args = list(test_mode = FALSE, test_value = NA_character_)) {

  user_choice <- ""

  current_loop_number <- 1

  max_number_of_loops <- 100

  while(TRUE) {

    print_menu(chr_vector)

    cat(quit_message, "\n", sep = "")

    if(test_args$test_mode) {

      user_choice <- test_args$test_value[current_loop_number]

    } else {

      user_choice <- readline(instruction_msg)

      }

    if(user_choice == quit_key) {

        break
    }

    if(check_choice(chr_vector, user_choice) == TRUE) {

        break
    }

    if(current_loop_number == max_number_of_loops) {

      stop(paste0("Max number of iterations through while loop reached.
                  Current max iterations is ", max_number_of_loops))

    }

    current_loop_number <- current_loop_number + 1

  }

  if(user_choice != quit_key & return_number == FALSE) {

    user_choice <- chr_vector[as.numeric(user_choice)]

  }

  return(user_choice)

}
