UserRead <- R6Class(
  classname = "UserRead",
  implement = ItemReader,
  inherit   = Item,
  public   = list(
    ItemRead = function() {
      sql<-'select * from mp_work.users'
      return(self$DdQuery(sql))
      
    }
  )
  
)

ur<-UserRead$new()
ur$ItemRead()
ur$DdDisconnect()
ur$con
