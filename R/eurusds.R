#' Get EUR-USD exchange rates
#'
#' The function gets EUR-USD exchange rates for the provided time period.
#'
#' @param date_from date. Formatted as yyyy-mm-dd
#' @param date_to date. Formatted as yyyy-mm-dd
#' @return data.table
#' @export
#'
#' @importFrom httr GET content
#' @importFrom logger log_debug
#' @importFrom data.table data.table
#'
#' @examples
#' eurusds('2019-05-20', '2019-05-27')
eurusds <- function(date_from, date_to) {
   # Send request to API
   response <- GET(
      'https://api.exchangeratesapi.io/history',
      query = list(
         start_at = date_from,
         end_at = date_to,
         base = 'USD',
         symbols = 'EUR'
      )
   )
   # Extract Rates
   exchange_rates <- content(response)$rates
   # Create a data table
   eurusds <- data.table(
      date = as.Date(names(exchange_rates)),
      eurusd = as.numeric(unlist(exchange_rates))
   )
   eurusds <- eurusds[order(date)]
   log_debug('Loaded exchange rates for {paste(min(eurusds$date), max(eurusds$date), sep = "-")}')
   return(eurusds)
}

