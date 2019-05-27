#' Get latest EUR-USD exchange rate
#'
#' The function returns the latest Euro - US Dollar exchange rate, i.e. the latest price
#' of 1 USD in EUR.
#'
#' @return number
#' @export
#' @importFrom httr GET content
#' @importFrom logger log_debug
#'
#'
eurusd <- function() {
   response <- GET('https://api.exchangeratesapi.io/latest?base=USD&symbols=EUR')
   eurusd <- as.numeric(content(response)$rates$EUR)
   log_debug('The current USD price is {round(eurusd, 3)}')
   return(eurusd)
}

