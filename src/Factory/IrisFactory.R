source('src/Core/Config.R')
source('src/itemReader/IrisRead.R')
source('src/itemProcessor/IrisProcessor.R')
source('src/Model/IrisModel.R')

IrisFactory <- R6Class(
  classname = "IrisFactory",
  portable  =FALSE,
  public   = list(
    Reader    =NA,
    Processor =NA,
    Model     =NA,
    initialize = function() {
      Reader<<-IrisReader$new()
      Processor<<-IrisProcessor$new()
      Model <<-IrisModel$new()
    }
    
  )
  
)
