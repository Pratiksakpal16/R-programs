##Skewness
library(e1071)
exp=faithful$eruptions
skewness(exp)
hist((exp))
kurtosis(exp)
