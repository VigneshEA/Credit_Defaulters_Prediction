#  Partition train datasets

trainindex<-createDataPartition(UCI_Crecard$default.payment.next.month, p = 0.8, list=F)
train<-UCI_Crecard[trainindex,]
valid<-UCI_Crecard[-trainindex,]

#  cross-validation strategy
ctrl = trainControl(method="repeatedcv",
                    number=2,
                    repeats=2)


# Create grid of parameters to be tuned
tGrid <-  expand.grid(mtry = c(4,5,16)) 

# Model for tuning
rf_model<-train( default.payment.next.month ~.,   # Standard formula notation
                 data=train[,-1],          # Except 'id'
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
v_pred <- predict(rf_model, valid[,-c(25)],type = "raw")


# Dataframe of results
com<-data.frame(predicted=v_pred,actual=valid$default.payment.next.month)
#  Accuracy
(accuracy<-sum(com$predicted == com$actual)/nrow(com))      # Check accuracy


# Make predictions for validation dataset
class_predictions <- predict(rf_model, valid[, -c(25) ], type="raw")
# What were actual values. Make actual of form 1,1,0,1 and as factor
actual<-as.factor(as.numeric(valid[,25])-1) 


confusionMatrix(class_predictions, actual,
                positive = "1",                 # Positive class is '1'
                dnn=c("predictions","actual"),  # Dimenson headings
                mode="prec_recall")    # Print precision and recall as well


#  Predict probabilities
prob_predictions <- predict(rf_model, valid[, -c(1,25) ], type="prob")
head(prob_predictions)


#  Draw ROC graph using predicted probabilities
df_roc<-roc(actual,prob_predictions[,1])
plot(df_roc,main="AUC" %s+% df_roc$auc)
