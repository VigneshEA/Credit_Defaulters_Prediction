#log_model <- glm(default_payment ~., data = train, family = binomial(link = "logit"))
#summary(log_model)
#saveRDS(log_model, "log_model.rds")
log_model <- readRDS("log_model.rds")
log_predictions <- predict(log_model, test, type="response")
logistic_default <- ifelse(log_predictions > 0.5, 1, 0)

table(logistic_default, test[,18])

accuracy <- table(logistic_default, test[,18])
#sum(diag(accuracy))/sum(accuracy)

logistic_results <- as.data.frame(logistic_default)
logistic_results$id <- rownames(logistic_results)

roccurve <- roc(test$default_payment ~ log_predictions)

