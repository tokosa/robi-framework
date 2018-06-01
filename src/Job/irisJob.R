source('src/Step/irisStep.R')

is<-IrisStep$new()

for(p in seq(0.1,0.9,by = 0.1)){
  is$Run(prob=p)
  
}

