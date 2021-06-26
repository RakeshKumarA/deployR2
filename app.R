library(plumber)
my_packages <- c("quantmod")
 install_if_missing <- function(p) {
 if(p %in% rownames(installed.packages())==FALSE){
 install.packages(p)}
 }
invisible(sapply(my_packages, install_if_missing))
library(quantmod)

port <- Sys.getenv('PORT')

server <- plumb("plumber.R")

server$run(
	host = '0.0.0.0',
	port = as.numeric(port),
	swagger=TRUE
)
