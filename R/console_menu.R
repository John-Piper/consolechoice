#' Prints out a menu from a character vector and waits for user selection
#'
#' @param chr_vector character vector
#' @param instruction_msg character.  Message shows under the menu selection
#' @param quit_key character.  Character value for the user to quit the menu
#' @param quit_message character.  Character value to explain how to quit the menu
#' @param logical.  TRUE return number choice.  FALSE returns the index of chr_vector
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
                         return_number = TRUE) {

  user_choice <- ""

  number_of_loops <- 0

  max_number_of_loops <- 100

  while(TRUE) {

    print_menu(chr_vector, instruction_msg)

    print(quit_message)

    user_choice <- readline("Please type in the console your choice from above and press enter: ")

    if(user_choice == quit_key) {

        break
    }

    if(check_choice(chr_vector, user_choice) == TRUE) {

        break
    }

    number_of_loops <- number_of_loops + 1

    if(number_of_loops == max_number_of_loops) {

      stop(paste0("Max number of iterations through while loop reached.
                  Current max iterations is ", max_number_of_loops))

    }

  }

  if(user_choice != quit_key & return_number != FALSE) {

    user_choice <- chr_vector[user_choice]

  }

  return(user_choice)

}
