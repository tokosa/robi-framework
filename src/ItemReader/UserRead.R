UserRead <- R6Class(
  classname = "UserRead",
  implement = ItemReaderInterface,
  inherit   = Item,
  public   = list(
    ItemRead = function() {
      self$DdConnect()
      sql<-'select * from mp_work.users'
      return(self$DdGetQuery(sql))
    }
  )
  
)

self<-UserRead$new()
s<-self$ItemRead()

ur$DdDisconnect()
ur$con
