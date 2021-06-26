# plumber.R


#* Return chart
#* @param add ticker in caps and add .NS for eg: TCS.NS, 
#* @param add from date in YYYY-MM-DD format
#* @post /chart
function(ticker, from){
  tcs <- tq_get(ticker,
                get = "stock.prices",
                from = from,
  )
  tcs
}
