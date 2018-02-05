install.packages('ggplot2')
install.packages('RColorBrewer')
install.packages('gridExtra')
install.packages('corrplot')
install.packages('unbalanced')


library(magrittr)     # Data pipelines: %>% %T>% %<>%.
library(unbalanced)   # Balancing using ubSMOTE Another library is=> DMwR
library(rpart)        # Model: decision tree.
library(randomForest) # For imputing using na.roughfix()  
library(C50)    # For decision tree modeling
library(e1071)        # For parameter tuning tune.nnet()
library(nnet)         # Model: neural network.
library(caret)        # createDataPartition(), confusionMatrix, featurePlot()
library(pROC)         # Draw roc graph & calculate AUC
library(stringi)      # For %s+% (string concatenate)
library(ggplot2)   # For plotting
library(ggthemes)
library(dplyr)

UCI_Crecard <- read.csv("C:\\Users\\Vignesh EA\\Desktop\\R Scripts\\Credit Defaulters\\details.csv")
str(UCI_Crecard)
names(UCI_Crecard)
dim(UCI_Crecard)
summary(UCI_Crecard)
unique(UCI_Crecard$SEX)
unique(UCI_Crecard$MARRIAGE)
unique(UCI_Crecard$EDUCATION)

rm(list=ls()) ; gc()


