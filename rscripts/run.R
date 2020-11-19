#' ---
#' title: Data Report: Run Scripts
#' purpose: run all of the scripts and R markdown scripts for report
#' author: emily.markowitz AT noaa.gov
#' start date: 2020-10
#' ---

rm(list=ls())


######KNOWNS#########
# maxyr <- 2021 # for example

authors0<-"Me, Myself, and I"
title0<-"My Amazing NOAA Tech Memo"
office0<-"F/SPO, OHC, OPR or OSF"
reportnum0<-"###"
OfficeLocation0<-"Alaska Fisheries Science Center

7600 Sand Point Way N.E.

Seattle, WA 98115-6349"

NOAALeaders<-"U.S. Department of Commerce

Wilbur L. Ross, Jr., Secretary  


National Oceanic and Atmospheric Administration

Neil A. Jacobs, Ph.D., Acting NOAA Administrator

 
National Marine Fisheries Service

Chris Oliver, Assistant Administrator for Fisheries "

#######WHAT KIND OF OUTPUT#######
#Is this for InDesign?
designflowin <- F


#############SAVE FILE LOCATIONS###############
dir.scripts<-paste0(getwd(), "/rscripts/")
script.run<-paste0(dir.scripts, "/run.r")
script.funct<-paste0(dir.scripts, "/functions.R")
script.data<-paste0(dir.scripts, "/data.r")
script.surveyspp<-paste0(dir.scripts, "/surveyspp.r")
script.dataDL<-paste0(dir.scripts, "/dataDownload.r")

dir.output<-paste0(getwd(), "/output/")
dir.output.todaysrun<-paste0(dir.output, "/",Sys.Date(),"/")
dir.create(dir.output.todaysrun)
dir.chapters<-paste0(dir.output.todaysrun, "/chapters/")
dir.create(dir.chapters)


#Functions specific to this section
source(script.funct)

#Data specific to this section
# source(script.surveyspp)
source(script.data)

######MAKE REPORT########


######FRONT MATTER############
counter0<-0
filename0<-paste0(counter0, "_FrontMatter_1Text")
counter<-counter0
rmarkdown::render(paste0(dir.scripts, "/0frontmatter.Rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "_",counter,".docx"))


######ABSTRACT############
counter0<-counter0+1
filename0<-paste0(counter0, "_Abstract_1Text")
rmarkdown::render(paste0(dir.scripts, "/1abstract.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "_",counter0,".docx"))

######INTRODUCTION############
counter0<-counter0+1
filename0<-paste0(counter0, "_Introduction_1Text")
rmarkdown::render(paste0(dir.scripts, "/2introduction.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "_",counter0,".docx"))

######METHODS############
counter0<-counter0+1
filename0<-paste0(counter0, "_Methods_1Text")
rmarkdown::render(paste0(dir.scripts, "/4methods.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "_",counter0,".docx"))


######RESULTS############
counter0<-counter0+1
filename0<-paste0(counter0, "_ResultsDiscussion_1Text")
rmarkdown::render(paste0(dir.scripts, "/5results.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "_",counter0,".docx"))


######DISCUSSION############
counter0<-counter0+1
filename0<-paste0(counter0, "_ResultsDiscussion_1Text")
rmarkdown::render(paste0(dir.scripts, "/6discussion.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "_",counter0,".docx"))

######ACKNOWLEGEMENTS############
counter0<-counter0+1
filename0<-paste0(counter0, "_Acknowledgments_1Text")
rmarkdown::render(paste0(dir.scripts, "/7acknowledgments.rmd"), 
                  output_dir = dir.chapters, 
                  output_file = paste0(filename0, "_",counter0,".docx"))


########MAKE MASTER DOCX################

#USE GUIDENCE FROM THIS LINK
#https://support.microsoft.com/en-us/help/2665750/how-to-merge-multiple-word-documents-into-one


###############METADATA##################
CreateMetadata(dir.out = paste0(dir.out, "/metadata"), 
               title = paste0("Data Report for ", survey, " Metadata ", Sys.Date()))
