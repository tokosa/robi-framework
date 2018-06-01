# package read
library(R6)
library(RJDBC)
library(erer)

path='src/Core/'

# CoreRead
file.sources = list.files(path=path,pattern="*.R$",ignore.case =T)
file.sources<-file.sources[-which(file.sources %in% c("Config.R"))] 
sapply(paste0(path,file.sources),source,.GlobalEnv)
