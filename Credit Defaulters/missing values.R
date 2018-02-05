# convert all intigers to numeric
UCI_Crecard$PAY_0<-as.numeric(UCI_Crecard$PAY_0)
UCI_Crecard$PAY_2<-as.numeric(UCI_Crecard$PAY_2)
UCI_Crecard$PAY_3<-as.numeric(UCI_Crecard$PAY_3)
UCI_Crecard$PAY_4<-as.numeric(UCI_Crecard$PAY_4)
UCI_Crecard$PAY_5<-as.numeric(UCI_Crecard$PAY_5)
UCI_Crecard$PAY_6<-as.numeric(UCI_Crecard$PAY_6)

str(UCI_Crecard)

#  Remove missing values ,names of numeric columns

numc<-UCI_Crecard[,-c(1)] %>%                         
  sapply( is.numeric) %>%     # Output is TRUE, FALSE...
  which() %>%                 # Output is col index wherever input is TRUE
  names()  

numc

# Impute missing values. 
UCI_Crecard[,numc] %<>% na.roughfix()     
UCI_Crecard[,-c(1)] %>%  is.na() %>% sum()  





