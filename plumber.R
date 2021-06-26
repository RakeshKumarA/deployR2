# plumber.R

#* @preempt __first__
#* @get /
function(req, res) {
  res$status <- 302
  res$setHeader("Location", "./__docs__/")
  res$body <- "Redirecting..."
  res
}


#* Return chart
#* @param add ticker in caps and add .NS for eg: TCS.NS, 
#* @param add from date in YYYY-MM-DD format
#* @post /chart
function(ticker, from){
  stockPrice <- fortify.zoo(getSymbols(Symbols = ticker, from=from, auto.assign = FALSE))
  stockPrice
}
