library(plumber)
install.packages('tidyquant')
library(tidyquant)

port <- Sys.getenv('PORT')

server <- plumb("plumber.R")

server$run(
	host = '0.0.0.0',
	port = as.numeric(port),
	swagger=TRUE
)
