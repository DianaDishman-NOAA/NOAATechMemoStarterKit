#' ---
#' title: Data Report: Select relevant species
#' purpose: List and select all of the relevant species for each survey
#' author: emily.markowitz AT noaa.gov
#' start date: 2020-10
#' ---

PKG <- c("knitr", "rmarkdown", "here", 
         # library(devtools)
         # devtools::install_github("emilyhmarkowitz/RMarkReports")
         "RMarkReports")
for (p in PKG) {
  if(!require(p,character.only = TRUE)) {  
    install.packages(p)
    require(p,character.only = TRUE)}
}



# General stuff
CapStr <- function(y) {
  c <- strsplit(y, " ")[[1]]
  paste(toupper(substring(c, 1,1)), substring(c, 2),
        sep="", collapse=" ")
}


