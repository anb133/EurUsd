#' Formats numbers in Euros
#' @param x number
#' @return string
#' @export
#' @importFrom scales dollar
#' @examples
#' eur(1000000)
#' eur(123.45678912345)
#'
eur <- function(x) {
   scales::dollar(x, prefix = '\u20ac', big.mark = ',')
}
