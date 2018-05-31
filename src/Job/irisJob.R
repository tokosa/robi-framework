source('src/Step/irisStep.R')

for(p in seq(0.1,0.9,by = 0.1)){
  IrisStep$new(prob=p)
}

