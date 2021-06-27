# plumber.R

#* @preempt __first__
#* @get /
function(req, res) {
  res$status <- 302
  res$setHeader("Location", "./__docs__/")
  res$body <- "Redirecting..."
  res
}


#* Return stockprice
#* @param ticker append .NS for eg: TCS.NS
#* @param from start date in YYYY-MM-DD format
#* @post /stockprice
function(ticker, from, to=Sys.Date() - 1){
  stockPrice <- fortify.zoo(getSymbols(Symbols = ticker, from=from, to=to, auto.assign = FALSE))
  stockPrice
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}
