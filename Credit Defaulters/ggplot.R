#boxplot for AGE
ggplot(data=UCI_Crecard,mapping = aes(x=AGE,y=UCI_Crecard$LIMIT_BAL,fill=default.payment.next.month)) + geom_boxplot() 

# bar plot for Marriage
ggplot(data=UCI_Crecard, mapping = aes(x=MARRIAGE, fill=default.payment.next.month)) + geom_bar()+theme_few()

#bar graph for sex
ggplot(data=UCI_Crecard, mapping = aes(x=SEX, fill=default.payment.next.month)) + geom_bar()+theme_few()

#bar graph for education
ggplot(data=UCI_Crecard,mapping = aes(x=EDUCATION,y=UCI_Crecard$LIMIT_BAL,fill=default.payment.next.month)) + geom_boxplot()

