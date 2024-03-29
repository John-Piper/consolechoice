#' Prints out a character vector starting with a sequential number as a menu
#'
#' Helper function for console_menu.
#'
#' @param chr_vector character vector.
#'
#' @return NULL
#'
#' @noRd
#'
#' @examples
#'
#' \dontrun{
#' print_menu(c("Item One", "Item Two"))
#' }
print_menu <- function(chr_vector) {

  max_index <- length(chr_vector)

  if (max_index == 0) {

    stop("Error: The Character vector length must be greater than one.", call. = FALSE)

  }

  numbers <- 1:max_index

  for (index in numbers) {

    cat(index, ": ", chr_vector[index],"\n", sep = "")
  }

}
