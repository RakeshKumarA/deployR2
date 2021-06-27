# plumber.R

#* @preempt __first__
#* @get /
function(req, res) {
  res$status <- 302
  res$setHeader("Location", "./__docs__/")
  res$body <- "Redirecting..."
  res
}

#* Return Stock Price
#* @param ticker add in caps and add .NS for eg: TCS.NS, 
#* @param from add date in YYYY-MM-DD format
#* @post /stockPrice
function(ticker, from, to=Sys.Date() - 1){
  stockPrice <- fortify.zoo(getSymbols(Symbols = ticker, from=from, to=to, auto.assign = FALSE))
  colnames(stockPrice)[colnames(stockPrice) == 'Index'] <- 'Date'
  stockPrice
}

#* Return stockPrice of list of stocks
#* @param tickers add in caps and add .NS sep by comma 
#* @param from add date in YYYY-MM-DD format
#* @post /stockPrices
function(tickers, from, to=Sys.Date() - 1){
  tickervector <- strsplit(string1, " ")[[1]]
  stockPrices <- fortify.zoo(getSymbols(Symbols = tickervector, from=from, to=to, auto.assign = FALSE))
  colnames(stockPrices)[colnames(stockPrices) == 'Index'] <- 'Date'
  stockPrices
}


