train1 <- sparse.model.matrix(default_payment~.-1,data = train)
train_label <- train[,"default_payment"]
train_matrix <- xgb.DMatrix(data = as.matrix(train1), label = train_label)

test1 <- sparse.model.matrix(default_payment~.-1,data = test)
test_label <- test[,"default_payment"]
test_matrix <- xgb.DMatrix(data = as.matrix(test1), label = test_label)


# Parameters
nc <- as.numeric(as.character(length(unique(train_label))))
xgb_params <- list("objective" = "binary:logistic",
                   "eval_metric" = "mlogloss",
                   "num_class" = nc)
watchlist <- list(train = train_matrix, test = test_matrix)

# eXtreme Gradient Boosting Model
#bst_model <- xgb.train(params = xgb_params,
#                      data = train_matrix,
#                     nrounds = 100,
#    watchlist = watchlist)