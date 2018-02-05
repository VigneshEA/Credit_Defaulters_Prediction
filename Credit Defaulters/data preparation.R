# for ggplot graph by renaming to meaningfull name for better look of graph
UCI_Crecard$AGE <-cut(UCI_Crecard$AGE, breaks = c( 10, 30,50,100), labels = c("young", "middle","senior"))
UCI_Crecard$SEX<-cut(UCI_Crecard$SEX, 2,labels = c("Female","Male"))
UCI_Crecard$MARRIAGE<-cut(UCI_Crecard$MARRIAGE, 4,labels = c("married","single","Devorce","other"))

convertcat <- c(3:5)

UCI_Crecard[,convertcat] <- data.frame(apply(UCI_Crecard[convertcat],2, as.factor))

UCI_Crecard$default.payment.next.month<-as.factor(UCI_Crecard$default.payment.next.month)
str(UCI_Crecard)
