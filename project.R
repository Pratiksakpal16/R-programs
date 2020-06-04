diadf=read.csv("C:/Users/Shrutika/Desktop/spyder programs/pratikproject/insurance.csv")
View(diadf)
str(diadf)#str is a function which defines each and every datatype
#par can be used to set or query graphical parameters.
par(mfrow=c(1,2))
#satter plot is used to visualize the linear relationship between the predictor and response
scatter.smooth(diadf$age~diadf$age)
scatter.smooth(diadf$sex~diadf$sex)
scatter.smooth(diadf$bmi~diadf$bmi)
scatter.smooth(diadf$children~diadf$children)
scatter.smooth(diadf$smoker~diadf$smoker)
scatter.smooth(diadf$region~diadf$region)

#boxplot is used to spot any outlier observations in the variable
boxplot(diadf$age,main="age",sub=paste("Outlier rows:",boxplot.stats(diadf$age)$out))
boxplot(diadf$bmi,main="bmi",sub=paste("outlier rows:",boxplot.stats(diadf$bmi)))
boxplot(diadf$children,main="children",sub=paste("Outlier rows:",boxplot.stats(diadf$children)$out))

library(e1071)#loading/attaching and listing of packages
par(mfrow=c(1,2))#par can be used to set or query graphical parameters

#skewness computes the skewness
#skewness is asymmetry in a stastical distribution in which the curve appears distorted or skewed
#density plot computes density estimates
plot(density(diadf$age,main="Density Plot:Age",ylab="Frequency",sub=paste("Skewness:",round(e1071::skewness(diadf$age),2))))
polygon(density(diadf$age),col="red")
plot(density(diadf$bmi),main="Density Plot:BMI",ylab="Frequency", sub=paste("Skewness:",round(e1071::skewness(diadf$bmi),2)))
polygon(density(diadf$bmi),col="red")
plot(density(diadf$children,main="Density Plot:Children",ylab="Frequency", sub=paste("Skewness:",round(e1071::skewness(diadf$children),2))))
polygon(density(diadf$children),col="red")

#lm function fits a linearmode to data r,s modelling function return an object that contains a lot of data
admode12=lm(formula = charges~age+sex+bmi+children+smoker+region,data = diadf)
linearMod=lm(charges~age+sex+bmi+children+smoker+region,data=diadf)
print(linearMod)
#sumary is a genric functn used to produce result sumaries of the results of various model fitting functions
summary(linearMod)
#significance code(astrisks) r used for quickly ranking the significamce of each variable
#'***' is one whose p value<0.0001
#residual std error is the std deviation of error term in regression equation
#degre of freedom shows association with the sources of variance
#r square is the measure of proportion of variability expld by regresion
#fstats is calculated to measure overall quality of regression
#p value is measure of how confident u can b that independet variablpredict dependent variable
modelSummary=summary(linearMod)
modelCoeffs=modelSummary$coefficients
admode12=lm(formula = charges~age+sex+bmi+children+smoker+region,data=diadf)
pred=predict(admode12,diadf)
#cbind combines r objects by rows or columns
final=cbind(diadf$charges,pred)
linearMod=lm(charges~age+sex+bmi+children+smoker+region,data=diadf)
distPred=predict(linearMod,diadf)
# make actualpredicts dataframe
actuals_preds=data.frame(cbind(actuals=diadf$charges,data=distPred))
correlation_accuracy=(actuals_preds)
#return the first or last part of an object
head(actuals_preds)
View(actuals_preds)
