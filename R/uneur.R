#' Formats string in a Euro format to a number
#'
#' The function is the reverse of \code{eur}.
#' @param x string. Should be in a Euro format
#' @return number
#' @export
#' @importFrom scales dollar
#' @examples
#' uneur("€1,000,000")
#' uneur("€-1.25")
#' @seealso eur
uneur <- function(x) {
   x <- gsub('€', '', x)
   as.numeric(gsub(',', '', x))
}
