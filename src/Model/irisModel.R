library(kernlab)
library( nnet )
library( e1071 )
IrisModel <- R6Class(
  classname = "ItemModel",
  public   = list(
    iris.svm=NA,
    iris.nnet=NA,
    iris.nb=NA,
    PredictSvm = function(train.d,test.d) {
      self$iris.svm<-ksvm(Species ~., data=train.d )
      return(predict(self$iris.svm, test.d))
    },
    PredictNnet = function(train.d,test.d) {
      self$iris.nnet<-nnet(Species ~ ., data = train.d, size = 2, rang = .1, decay = 5e-4, maxit = 200,trace=F)
      return(predict(self$iris.nnet,test.d,type="class"))
    },
    PredictNb=function(train.d,test.d){
      self$iris.nb<-naiveBayes(Species ~ ., data = train.d)
      return(predict(self$iris.nb,test.d,type="class"))

    }
  )
  
)

