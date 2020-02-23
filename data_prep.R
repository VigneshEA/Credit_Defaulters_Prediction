data <- read.csv("details1.csv")
ref_data <- data
colnames(data)[colnames(data)=="default.payment.next.month"] <- "default_payment"
dupdata <- data
data[, 1:25] <- sapply(data[, 1:25], as.character)
data[, 1:25] <- sapply(data[, 1:25], as.numeric)

data$EDUCATION[data$EDUCATION == 0] <- 4
data$EDUCATION[data$EDUCATION == 5] <- 4
data$EDUCATION[data$EDUCATION == 6] <- 4
data$MARRIAGE[data$MARRIAGE == 0] <- 3

#for data exlporation
dupdata$EDUCATION[dupdata$EDUCATION == 0] <- 4
dupdata$EDUCATION[dupdata$EDUCATION == 5] <- 4
dupdata$EDUCATION[dupdata$EDUCATION == 6] <- 4
dupdata$MARRIAGE[dupdata$MARRIAGE == 0] <- 3
dupdata$AGE <-cut(dupdata$AGE, breaks = c( 10, 30,50,100), labels = c("young", "middle","senior"))
dupdata$SEX<-cut(dupdata$SEX, 2,labels = c("Female","Male"))
dupdata$MARRIAGE<-cut(dupdata$MARRIAGE, 4,labels = c("married","single","Divorced","other"))
dupdata$EDUCATION<-cut(dupdata$EDUCATION, 4,labels = c("GraduateSchool","University","High school","Other"))

set.seed(123)
correlationMatrix <- round(cor(data),1)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.8,verbose=T)
data <- data[,-highlyCorrelated]
dupdata <- dupdata[,-highlyCorrelated]
data <- data[,-c(1,6)]
dupdata <- dupdata[,-c(1)]

data1 <- data
data1[, c(1,5:17)] <- scale(data1[, c(1,5:17)])

data1[,c(2:4,18)] <- data.frame(apply(data1[c(2:4,18)],2, as.factor))
#str(data1)
ind <- sample(2,nrow(data1),replace = T,prob = c(0.8,0.2))
train <- data1[ind==1,]
test <- data1[ind==2,]