#' Checks if the choice is within the length of a character vector
#' Helper function for console_menu
#'
#' @param choices character vector
#' @param choice numeric or character.  Character values will convert to 0 in the function.
#'
#' @return If the choice is a number within the length range of the choices the return value will be TRUE.
#'         If the choice is a number but is not within the length range of the choice the return value will be FALSE.
#'         If the choices argument is not a character vector with a length of at least one then the program will stop
#' @export
#' @examples
#'
#' check_choice(c("a", "b"), 1)
#'
#' check_choice(c("a", "b"), 2)
#'
#' check_choice(c("a", "b"), 3)
#'
#' check_choice(c("a", "b"), "a")
check_choice <- function(choices, choice) {

  if(length(choices) == 0) {
    stop("An empty character vector can not be used.  Please use a character vector of a least the length of one")
  }

  if(is.list(choices)) {
    stop("A list can not be used.  Please only use a character vector")
  }

  if(class(choices) != "character") {
    stop("A non character vector was passed as an argument.  Please use a character vector")
  }

  choice <- as.numeric(gsub("[^1-9]", 0, choice))

  if (is.numeric(choice)) {

    max_number_choice <- length(choices)

    if(choice >= 1 & choice <= max_number_choice) {

      return(TRUE)

    }
  }

  return(FALSE)

}
