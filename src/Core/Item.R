
Item<-R6Class(
  classname="Item",
  private=list(
    driver = JDBC(Sys.getenv('REDSHIFT_DRIVER'),Sys.getenv('REDSHIFT_DRIVER_PATH'), identifier.quote="`"),
    url = sprintf(
      'jdbc:redshift://%s:%s/%s?ssl=true&sslMode=verify-full&sslrootcert=%s&user=%s&password=%s',
      Sys.getenv('REDSHIFT_HOST'),
      Sys.getenv('REDSHIFT_PORT'),
      Sys.getenv('REDSHIFT_DB'),
      Sys.getenv('REDSHIFT_CA'),
      Sys.getenv('REDSHIFT_USER'),
      Sys.getenv('REDSHIFT_PASS'))
  ),
  public = list(
    con    = NA,
    # constractor
    DdConnect = function(schema=NA) {
        self$con<-dbConnect(private$driver, private$url)
        if(!is.na(schema)){
          dbSendUpdate(self$con,paste0('set search_path to ',schema))
        }
    },
    DdDisconnect=function(){
        dbDisconnect(self$con)
    },
    DdGetQuery=function(sql,mode=NA){
        return(dbGetQuery(self$con, sql))
    },
    DdUpdateQuery=function(sql){
        return(dbGetQuery(self$con, sql))
    },
    # Sqlファイルから読み込む
    ScanQuery = function(query_path) {
        return (
          scan(query_path, what='', quote='', sep='\n', comment.char = '', fileEncoding='UTF-8') %>% 
            #gsub(pattern='--.*$', replacement='') %>% # 正規表現でコメントアウトを消す
            # paste0(collapse=' ')
            paste(collapse='\n')
        )
    },
    BindParam=function(tx,from,to,num=1){
      if(length(from) != length(to)) stop("not match length!!")
      if(length(from) < num) return(tx)
      Recall(gsub(from[num],to[num],tx),from,to,num+1)
    },
    finalize = function() {
      self$DdDisconnect()
    }
    
 )
)