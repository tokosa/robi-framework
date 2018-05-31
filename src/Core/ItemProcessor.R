ItemProcessor <- R6Class(
  classname = "ItemProcessor",
  public   = list(
    train =NA,
    test  =NA,
    ItemSampling = function(data,prob) {
      idx<-sample(nrow(data),nrow(data)*prob)
      self$train<-data[idx,]
      self$test<-data[-idx,]
      
    }
    
  )
  
)
