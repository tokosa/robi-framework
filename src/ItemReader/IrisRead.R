IrisReader <- R6Class(
  classname = "irisReader",
  implement = ItemReaderInterface,
  inherit   = Item,
  public   = list(
    ItemRead = function() {
      return(iris)
      
    }
  )
  
)
