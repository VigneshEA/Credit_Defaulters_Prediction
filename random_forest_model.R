#  Partition train datasets

#trainindex<-createDataPartition(data1$default_payment, p = 0.8, list=F)
#trainrf<-data1[trainindex,]
#validrf<-data1[-trainindex,]

#  cross-validation strategy
ctrl = trainControl(method="repeatedcv",
                    number=2,
                    repeats=2)


# Create grid of parameters to be tuned
tGrid <-  expand.grid(mtry = c(4,5,16)) 
#ded <- read.csv("details1.csv")
# Model for tuning
rf_model<-train( default_payment ~.,   # Standard formula notation
                 data=train,          
                 method="rf",              # randomForest
                 nodesize= 10,             # 10 data-points/node. Fastens up modeling
                 ntree =50,            # Default 500. Reduced to fasten up modeling
                 do.trace=50,           # Print output after every 4 trees
                 trControl=ctrl,           # cross-validation strategy
                 tuneGrid = tGrid,         # Grid of parameters to be tuned
                 metric = "Accuracy"       # Default metric
)

#  Results
rf_model$results

rf_model$bestTune 


rf_model$finalModel 



#### Prediction with RF model
v_pred <- predict(rf_model, test[,-c(18)],type = "raw")


# Dataframe of results
com<-data.frame(predicted=v_pred,actual=test$default_payment)
#  Accuracy
accuracyrf <-sum(com$predicted == com$actual)/nrow(com)      # Check accuracy


# Make predictions for validation dataset
class_predictions <- predict(rf_model, test[, -c(18) ], type="raw")
# What were actual values. Make actual of form 1,1,0,1 and as factor
actual<-as.factor(as.numeric(test[,18])-1) 


cnf_rf <- confusionMatrix(class_predictions, actual,
                positive = "1",                 # Positive class is '1'
                dnn=c("predictions","actual"),  # Dimenson headings
                mode="prec_recall")    # Print precision and recall as well


#  Predict probabilities
prob_pred_rf <- predict(rf_model, test[, -c(18) ], type="prob")

prob_pred_rf$rfdefault <- ifelse(prob_pred_rf$`1` > 0.5, 1, 0)

#  Draw ROC graph using predicted probabilities
df_roc<-roc(actual,prob_pred_rf[,1])

plot(df_roc,main="AUC" %s+% df_roc$auc)

rf_results <- as.data.frame(prob_pred_rf)
rf_results$id <- rownames(rf_results)
rf_results$`0` <- NULL
rf_results$`1` <- NULL
