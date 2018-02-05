# density plot
ggplot(UCI_Crecard, aes(x = SEX, fill = default.payment.next.month)) + geom_density()

ggplot(UCI_Crecard, aes(x = AGE, fill = default.payment.next.month)) + geom_density()

ggplot(UCI_Crecard, aes(x = EDUCATION, fill = default.payment.next.month)) + geom_density() + xlab("Default Payment Status") + ylab("Customer Count") 

