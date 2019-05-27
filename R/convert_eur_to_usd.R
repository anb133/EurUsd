#' Convert USD to EUR
#'
#' The function looks up the most recent USD/EUR exchange rate and computes the provided
#' USD amount in EUR.
#' @param usd number
#' @return number
#' @export
#' @importFrom httr GET content
#' @importFrom logger log_debug
#' @examples
#' convert_usd_to_eur(100)

convert_usd_to_eur <- function(usd) {
   eurusd <- eurusd()
   log_debug('The current USD price is {round(eurusd, 2)}')

   usd * eurusd
}
