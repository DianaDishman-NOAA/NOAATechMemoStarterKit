#' ---
#' title: Data Report: Select relevant species
#' purpose: List and select all of the relevant species for each survey
#' author: emily.markowitz AT noaa.gov
#' start date: 2020-10
#' ---

#############INSTALL PACKAGES##############
# Here we list all the packages we will need for this whole process
# We'll also use this in our works cited page!!!
PKG <- c( 
  # For creating R Markdown Docs
  "knitr", # A general-purpose tool for dynamic report generation in R
  "rmarkdown", # R Markdown Document Conversion

  # File Management
  "here", # For finding the root directory of your scripts and thus, find your files
  
  # Keeping Organized
  "devtools", # Package development tools for R; used here for downloading packages from GitHub
  "packrat", # Packrat is a dependency management system for R.

  # Graphics
  # "ggplot2", # Create Elegant Data Visualisations Using the Grammar of Graphics
  
  # Text
  "RMarkReports", # devtools::install_github("emilyhmarkowitz/RMarkReports") # Package of my favorite grammar and file managment functions for writing reproducible reports
  
  # Data Manipulation
  # "tidyr", # Tidy Messy Data
  # "dplyr" # A Grammar of Data Manipulation
  
  # tidyverse
  "tidyverse"
  )

for (p in PKG) {
  if(!require(p,character.only = TRUE)) {  
    install.packages(p)
    require(p,character.only = TRUE)}
}


#############SAVE FILE LOCATIONS###############
# Just in case you change the base name for any reason, it will change for anytime you load the files inside the folder, too! (e.g., if you have something against "scripts" being the name of the folder, just let the script know in one place aka right here). 
library(here)

# Where the files we will need are saved
dir.scripts<-paste0(here::here(), "/rscripts/")

# Where we save everything
dir.output<-paste0(here::here(), "/output/")
dir.output.todaysrun<-paste0(dir.output, "/",Sys.Date(),"/")
dir.create(dir.output.todaysrun)
dir.chapters<-paste0(dir.output.todaysrun, "/chapters/")
dir.create(dir.chapters)
dir.rawdata<-paste0(dir.output.todaysrun, "/rawdata/")
dir.create(dir.rawdata)

# If loading in InDesign, table and figure headers need to be their own .docx. Here's a file that will do that for you. 
TableFigureHeader<-system.file("rmd", "TableFigureHeader.Rmd", package = "RMarkReports")

#######REFERENCE WORD DOCUMENT###########
file.copy(from = paste0(dir.scripts, refdoc), 
          to = paste0(dir.scripts, "word-styles-reference.docx"), 
          overwrite = TRUE)


#########FUNCTIONS##########

#' Systematically save your ggplot figure for your report
#'
#' @param plot The ggplot you would like to be saved
#' @param filename0 # The filename for your chapter
#' @param cnt.chapt.content # The order number that this exists in the chapter
#' @param cnt.graphs # The figure number 
#' @param width # Default = 6 inches
#' @param height # Default = 6 inches
#'
#' @return
#' @export
#'
#' @examples
SaveGraphs<-function(plot, filename0, cnt.chapt.content, cnt.graphs, path, width = 6, height = 6){
  ggsave( # save your plot
    path = path, 
    filename = paste0(filename0, cnt.chapt.content, "Fig", cnt.graphs, 
                      ".pdf"), # Always save in pdf so you can make last minute edits in adobe acrobat!
    plot = plot, # call the plot you are saving
    width = width, height = height, units = "in") #recall, A4 pages are 8.5 x 11 in - 1 in margins
}



#' Systematically save your report tables for your report
#'
#' @param table.raw Optional. The data.frame that has no rounding and no dividing of numbers (good to save this for record keeping)
#' @param table.print The data.frame as table will be seen in the report.
#' @param filename0 The name you want to save this file as.
#' @param dir.chapters Directory where you are saving all of your chapter word documents to.
#' @param dir.outputtables Directory where you are saving all of your tables to. 
#' @param THeader The header or title of your table
#' @param cnt.chapt.content # The order number that this exists in the chapter
#' @param cnt.tables # The figure table 
#'
#' @return
#' @export
#'
#' @examples
SaveTables<-function(table.raw, table.print, THeader, TFootnotes = NA, 
                     filename00, dir.chapters, dir.outputtables,
                     cnt.chapt.content, cnt.tables){

  filename00<-paste0(path, filename0, cnt.chapt.content, "Fig", cnt.graphs)
  
  # Save raw file (no rounding, no dividing)
  if (is.na(table.raw)){
    write.table(x = table.raw,  
                  file = paste0(dir.outputtables, filename0, "_raw.csv"), 
                  sep = ",",
                  row.names=FALSE, col.names = F, append = F)
  }
  
  # Save file of content going into the report
  write.table(x = table.print,  
              file = paste0(dir.outputtables, filename0, "_print.csv"), 
              sep = ",",
              row.names=FALSE, col.names = F, append = F)
  
  # Save file with header and footnotes

  write.table(THeader,  
              file = paste0(dir.chapters, filename0, ".csv"), 
              sep = ",",
              row.names=FALSE, col.names = F, append = F)
  
  write.table(table.print,  
              file = paste0(dir.chapters, filename0, ".csv"), 
              sep = ",",
              row.names=FALSE, col.names = F, append = T)
  
  if (!is.null(TFootnotes) | TFootnotes %in% "") ) {
    
    write.table("",  
                file = paste0(dir.chapters, filename0, ".csv"), 
                sep = ",",
                row.names=FALSE, col.names = F, append = T)
    
    a<-strsplit(x = TFootnotes, split = " 123456789 ")[[1]]
    a<-unique(a)
    write.table(a,  
                file = paste0(dir.chapters, filename0, ".csv"), 
                sep = ",",
                row.names=FALSE, col.names = F, append = T)
  }
  
  # #footnote-ify table.print footnote column for rmarkdown
  # if (is.data.frame(table.print)) {
  #   table.print$Footnotes<-list2string.ft(x = table.print$Footnotes)
  # }
}



# General stuff
CapStr <- function(y) {
  c <- strsplit(y, " ")[[1]]
  paste(toupper(substring(c, 1,1)), substring(c, 2),
        sep="", collapse=" ")
}


