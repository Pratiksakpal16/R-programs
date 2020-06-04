diadf=read.csv("C:/Users/Shrutika/Desktop/rprograms/Regression_analysis/diabetes.csv")
View(diadf)
str(diadf)
diadf$Outcome=as.factor(diadf$Outcome)
str(diadf)

logisticmod1=glm(Outcome~DiabetesPedigreeFunction,data=diadf,family="binomial")

diadf1=read.csv("C:/Users/Shrutika/Desktop/rprograms/Regression_analysis/diabetes.csv")
View(diadf1)
diaf1$Outcome=as.factor(diadf1$Outcome)
logisticmod1=glm(Outcome~DiabetesPedigreeFunction+Age+Insulin,data=diadf1,family = "binomial")
summary(logisticmod1)

predict(logisticmod1,data.frame(DiabetesPedigreeFunction=2.88,Age=33,Insulin=168),type="response")

fact=as.factor(predict(logisticmod1,data.frame(DiabetesPedigreeFunction=2.88,Age=33,Insulin=168)))

