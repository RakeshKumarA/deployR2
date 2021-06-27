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

#* Return chart
#* #* @param ticker add in caps and add .NS for eg: TCS.NS, 
#* @param from add date in YYYY-MM-DD format
#* @png
#* @post /chart
function(ticker, from, to=Sys.Date() - 1){
  
  chartSeries(getSymbols(Symbols = ticker, from=from, to=to, auto.assign = FALSE), 
              theme=chartTheme('white'))
}


