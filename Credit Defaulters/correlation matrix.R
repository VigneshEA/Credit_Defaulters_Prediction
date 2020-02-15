#  Initialise random numbers for repeatable results.
set.seed(123)
# corelation between variables to reject unimportant variables
correlationMatrix <- cor(UCI_Crecard[,8:24])


highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.8,verbose=T)
print(highlyCorrelated)
d <- data[,-highlyCorrelated]
new <- correlationMatrix[,-highlyCorrelated]
new
