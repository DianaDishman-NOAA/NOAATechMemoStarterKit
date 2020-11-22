#' ---
#' title: Report Template: Run Scripts and R Markdown Files
#' purpose: Run Scripts and R Markdown Files
#' author: Me, myself, and I (me.noaa.gov)
#' start date: YYYY-MM
#' Notes: I've updated this script several times, specifically... 
#' ---


####### PLEASE READ: Notes for the User Using this Script: ######

##### 1. On your keyboard, press 'Shift' + 'Control' + 'O'. This will open the report outline to the right of this window. Here you can see the complete layout of this script (and all scripts) and thus, this report you are creating!

#####  2. Examples in this template require that you install the following packages (script built into the 'functions.R' script. Unless otherwise noted, the below can be installed from CRAN:

# Must have:
# - knitr # A general-purpose tool for dynamic report generation in R
# - rmarkdown # R Markdown Document Conversion

# To be savvy
# - here # For finding the root directory of your scripts and thus, find your files
# - devtools # Package development tools for R; used here for downloading packages from GitHub
# - packrat # Packrat is a dependency management system for R.

# You'll eventually need these anyway
# - ggplot2 # Create Elegant Data Visualisations Using the Grammar of Graphics
# - RMarkReports; devtools::install_github("emilyhmarkowitz/RMarkReports") # Package of my favorite grammar and file managment functions for writing reproducible reports
# - tidyr # Tidy Messy Data
# - dplyr # A Grammar of Data Manipulation

# Note, most of these are automatically loaded by installing "tidyverse" package, so I won't install some of the above when I install:
# - tidyverse # Easily Install and Load the 'Tidyverse'


#####  3. File Naming. 
# May I suggest... A STRICT NAMING STRUCTURE
# A. Filenames: [order of the chapter]_[Chapter Title for Humans to Read]_[Type of Content (e.g., "Text", "Figure", "Table")]_""

  # This relates to, for example: paste0(filename0, "Text_", cnt.chapt.content,".docx")

##### 4. Add the README and LICENCE files to the root directory for your GitHub

######START#######

# Always start with a clean state by removing everything in your environment!
rm(list=ls())


######***KNOWNS#########
maxyr <- 2021 # or the year of the report, for example

# For the 0frontmatter.Rmd file
authors0<-"Me, Myself, and I"
title0<-"My Amazing NOAA Tech Memo"
office0<-"F/SPO, OHC, OPR or OSF"
reportnum0<-"###"
OfficeLocation0<-"Alaska Fisheries Science Center

7600 Sand Point Way N.E.

Seattle, WA 98115-6349"

NOAALeaders0<-"U.S. Department of Commerce

Wilbur L. Ross, Jr., Secretary  


National Oceanic and Atmospheric Administration

Neil A. Jacobs, Ph.D., Acting NOAA Administrator

 
National Marine Fisheries Service

Chris Oliver, Assistant Administrator for Fisheries "

#######***WHAT KIND OF OUTPUT#######
#Is this for InDesign? 
designflowin <- F

#######***REFERENCE WORD DOCUMENT###########
# Choices: 
# "refdoc_NOAATechMemo.docx"
#   This uses the classic NOAA Tech Memo report as a guideline, in all of it's Times New Roman glory. 
# "refdoc_FisheriesEconomicsOfTheUS.docx"
#   This uses the same styles as those found in FEUS, which are considerably prettier. 

refdoc<-"refdoc_NOAATechMemo.docx" #Choose Here

#######***LOAD PROJECT LIBRARIES AND FUNCTIONS#############
#Functions specific to this section
source("./rscripts/functions.R")

#######***LOAD PROJECT Data#############
#Data specific to this section
# source(paste0(dir.scripts, "/dataDownload.r"))
source("./rscripts/data.R")

######MAKE REPORT########
cnt.chapt<-"000" # Keep everything in a proper order
cnt.figures<-"000" # This will autoname your figures with consecutive numbers (e.g., Figure 1.)
cnt.tables<-"000" # This will autoname your tables with consecutive numbers (e.g., Table 1.)

######***FRONT MATTER############
cnt.chapt<-auto_counter(cnt.chapt) # The order of the chapter in the report
cnt.chapt.content<-"001" # The order of the content in the report (e.g., figures, images, tables)
filename0<-paste0(cnt.chapt, "_FrontMatter_") #Seperated because we'll need it inside the RMarkdown
rmarkdown::render(paste0(dir.scripts, "/0frontmatter.Rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))


######***ABSTRACT############
cnt.chapt<-auto_counter(cnt.chapt) 
cnt.chapt.content<-"001" 
filename0<-paste0(cnt.chapt, "_Abstract_")
rmarkdown::render(paste0(dir.scripts, "/1abstract.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))

######***INTRODUCTION############
cnt.chapt<-auto_counter(cnt.chapt) 
cnt.chapt.content<-"001" 
filename0<-paste0(cnt.chapt, "_Introduction_")
rmarkdown::render(paste0(dir.scripts, "/2introduction.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))

######***METHODS############
cnt.chapt<-auto_counter(cnt.chapt) 
cnt.chapt.content<-"001" 
filename0<-paste0(cnt.chapt, "_Methods_")
rmarkdown::render(paste0(dir.scripts, "/4methods.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))


######***RESULTS############
cnt.chapt<-auto_counter(cnt.chapt) 
cnt.chapt.content<-"001" 
filename0<-paste0(cnt.chapt, "_ResultsDiscussion_")
rmarkdown::render(paste0(dir.scripts, "/5results.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))


######***DISCUSSION############
cnt.chapt<-auto_counter(cnt.chapt) 
cnt.chapt.content<-"001" 
filename0<-paste0(cnt.chapt, "_ResultsDiscussion_")
rmarkdown::render(paste0(dir.scripts, "/6discussion.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))

######***ACKNOWLEGEMENTS############
cnt.chapt<-auto_counter(cnt.chapt) 
cnt.chapt.content<-"001" 
filename0<-paste0(cnt.chapt, "_Acknowledgments_")
rmarkdown::render(paste0(dir.scripts, "/7acknowledgments.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))

######***WORKS CITED############
cnt.chapt<-auto_counter(cnt.chapt) 
cnt.chapt.content<-"001" 
filename0<-paste0(cnt.chapt, "_WorksCited_")
rmarkdown::render(paste0(dir.scripts, "/8worksCited.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "Text_", cnt.chapt.content,".docx"))


########***MAKE MASTER DOCX################

#USE GUIDENCE FROM THIS LINK
#https://support.microsoft.com/en-us/help/2665750/how-to-merge-multiple-word-documents-into-one


###############***METADATA##################
# So we can 
#    1. Go back and recreate this exactly with the libraries you used to create this script and 
#    2. Cite the apropriate versions of the packages you used in your report
# More info here: https://rstudio.github.io/packrat/walkthrough.html

CreateMetadata(dir.out = paste0(dir.out, "/metadata"), 
               title = paste0("Data Report for ", survey, " Metadata ", Sys.Date()))

setwd(paste0(dir.output.todaysrun))
packrat::snapshot() 
