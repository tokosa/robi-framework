source('src/itemReader/IrisRead.R')
source('src/itemWriter/IrisWriter.R')
source('src/itemProcessor/IrisProcessor.R')
source('src/Model/IrisModel.R')

IrisFactory <- R6Class(
  classname = "IrisFactory",
  portable  =FALSE,
  public   = list(
    Reader    =NA,
    Processor =NA,
    Writer    =NA,
    Model     =NA,
    initialize = function() {
      Reader<<-IrisReader$new()
      Processor<<-IrisProcessor$new()
      Writer<<-IrisWriter$new()
      Model <<-IrisModel$new()
    }
    
  )
  
)
