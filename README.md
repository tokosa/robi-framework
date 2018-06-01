# Welcome to the R batch framework 
The batch framework base is Java spring（java batch framework）

* Structure of the directory and file
```
~/robi-framework/src% tree
.
├── Core
│   ├── Config.R
│   ├── Item.R
│   ├── ItemProcessor.R
│   └── ItemReaderInterface.R
├── Factory
│   └── IrisFactory.R
├── ItemProcessor
│   └── IrisProcessor.R
├── ItemReader
│   ├── IrisRead.R
│   └── UserRead.R
├── Job
│   ├── irisJob.R
│   └── script.R.log
├── Model
│   └── irisModel.R
└── Step
    └── irisStep.R
```

# quick start
Initial setting
```
install.packages('R6')
install.packages("devtools")
devtools::install_github("rappster/R6", ref = "feat_interface")

# R session restart 

install.packages('rJava')
install.packages('RJDBC')
install.packages('erer')
install.packages('e1071')
```
* open job file
```
src/job/irisJob.R
```
* R stuido or R console 
```
Select and run the script
```

* R CMD
```
R CMD BATCH --slave --vanilla  src/job/irisJob.R log/irisJob.log
```
* result out put to see
```
/data dir
```
