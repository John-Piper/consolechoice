#' Checks if the choice is within the length of a character vector
#'
#' Helper function for console_menu.
#'
#' @param choices character vector.
#' @param choice numeric or character.  Character values will convert to 0 in the function.
#'
#' @return If the choice is a number within the length range of the choices the return value will be TRUE.
#'         If the choice is a number but is not within the length range of the choice the return value will be FALSE.
#'         If the choices argument is not a character vector with a length of at least one then the program will stop.
#'
#' @examples
#'
#' \dontrun{
#' check_choice(c("a", "b"), 1)
#'
#' check_choice(c("a", "b"), 2)
#'
#' check_choice(c("a", "b"), 3)
#'
#' check_choice(c("a", "b"), "a")
#' }
check_choice <- function(choices, choice) {

  if (length(choices) == 0) {
    stop("Error: The character vector length requirs to be one or greate than one.")
  }

  if (is.list(choices)) {
    stop("Error: A list was used in the argument.  Only a character vector can be used.")
  }

  if (class(choices) != "character") {
    stop("Error: A non character vector was passed as an argument.")
  }

  # grepl will return false if a non numeric character is in the string.
  if (!grepl("[^0-9]", choice)) {

    choice <- as.numeric(choice)

    if (is.numeric(choice)) {

      max_number_choice <- length(choices)

      if (choice >= 1 & choice <= max_number_choice) {

        return(TRUE)

      }
    }
  }

  return(FALSE)

}
