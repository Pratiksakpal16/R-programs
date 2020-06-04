View(cars)
scatter.smooth(x=cars$speed,y=cars$dist,main="Dist ~ Speed")
par(mfrow=c(1,2))

boxplot(cars$speed, main="Speed", sub=paste("Outlier rows:",boxplot.stats(cars$speed)$out))

boxplot(cars$dist, main="Distance", sub=paste("Outlier rows:",boxplot.stats(cars$dist)$out))
library(e1071)
par(mfrow=c(1,2))

plot(density(cars$speed,main="Density Plot:Speed",ylab="Frequency", sub=paste("Skewness:",round(e1071::skewness(cars$speed),2))))
polygon(density(cars$speed),col="red")

plot(density(cars$dist),main="Density Plot:Distance",ylab="Frequency", sub=paste("Skewness:",round(e1071::skewness(cars$dist),2)))

polygon(density(cars$dist),col="red")
cor(cars$speed,cars$dist)
linearMod=lm(dist ~ speed,data=cars)
print(linearMod)
summary(linearMod)
modelSummary=summary(linearMod)
modelCoeffs=modelSummary$coefficients
beta.estimate=modelCoeffs["speed","Estimate"]
std.error=modelCoeffs["speed","Std.Error"]
tvalue=beta.estimate/std.error
pvalue=2*pt(-abs(tvalue),df=nrow(cars)-ncol(cars))
fstatistic=linearMod$statistics[1]
f=summary(linearMod)$fstatistic
modelp=pf(f[1],f[2],f[3],lower=FALSE)
AIC(linearMod)
BIC(linearMod)
set.seed(100)
trainingRowIndex=sample(1:nrow(cars),0.8*nrow(cars))
trainingData=cars[trainingRowIndex,]
testData=cars[-trainingRowIndex,]
lmMod=lm(dist ~ speed,data=trainingData)
distPred=predict(lmMod,testData)
summary(lmMod)
AIC(lmMod)
actualpreds=data.frame(cbind(actuals=testData$dist,predicteds=distPred))
correlationaccuracy=cor(actualspreds) 
head(actualspreds)
minmaxaccuracy=mean(apply(actualspreds.,1,min)/apply(actualspreds,1,max))
mape=mean(abs((actualspreds$preicteds-actualspreds$actuals))/actualspreds$actuals)





