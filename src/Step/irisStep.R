source('src/Factory/IrisFactory.R')
IrisStep <- R6Class(
  classname = "IrisStep",
  portable = FALSE,
  public   = list(
    ir=NA,
    prob=NA,
    result=list(),
    initialize=function(){
      prob<<-prob
      ir<<-IrisFactory$new()
    },
    Run=function(prob=NA){
      prob<<-prob
      
      StepRead()

      print(paste0('train:',nrow(ir$Processor$train)))
      print(paste0('test:',nrow(ir$Processor$test)))
      
      StepSvm()
      StepNnet()
      StepNb()
      StepWrite()
      print('end Iris step')
    },
    StepRead=function(){
      # Item read
      print("read")
      ir.d<-ir$Reader$ItemRead()
      ir$Processor$ItemSampling(ir.d,prob)
      
    },
    StepSvm=function(){
      print("StepSvm")
      # train
      svm.res<-ir$Model$PredictSvm(ir$Processor$train,ir$Processor$test)
      # predict
      result[['Svm']]<<-table(svm.res,ir$Processor$test$Species)
    },
    StepNnet=function(){
        # train
      print("StepNnet")
      
      nnet.res<-ir$Model$PredictNnet(ir$Processor$train,ir$Processor$test)
      # predict
      result[['Nnet']]<<-table(nnet.res,ir$Processor$test$Species)
     
    },
    StepNb=function(){
      # train
      print("SteNnet")
      
      nb.res<-ir$Model$PredictNb(ir$Processor$train,ir$Processor$test)
      # predict
      result[['Nb']]<<-table(nb.res,ir$Processor$test$Species)
      
    },
    StepWrite=function(){
      filename=paste0('iris_',prob,'.txt')
      ir$Writer$ItemWrite(result,filename)
    }
  )    
)

