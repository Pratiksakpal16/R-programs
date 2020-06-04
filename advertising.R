data=read.csv("C:/Users/Shrutika/Desktop/rprograms/Regression_analysis/Advertising.csv")
View(data)

scatter.smooth(data$TV~data$TV)
scatter.smooth(data$Radio~data$Radio)
scatter.smooth(data$Newspaper~data$Newspaper)

boxplot(data$TV, main="tv", sub=paste("Outlier rows:",boxplot.stats(data$TV)$out))
boxplot(data$Radio, main="radio", sub=paste("Outlier rows:",boxplot.stats(data$Radio)$out))
boxplot(data$Sales,main="sales",sub=paste("outlier rows:",boxplot.stats(data$Sales)))


admode12=lm(formula = Sales~TV+Radio+Newspaper,data = data)
set.seed(100)
trainingRowIndex=sample(1:nrow(data),0.8*nrow(data))
trainingData=data[trainingRowIndex,]
testingdata=data[-trainingRowIndex,]
View(trainingData)
admode13=lm(Sales~TV+Radio,data=trainingData)
summary(admode13)

predict(admode13,data.frame(TV=195.4,Radio=32.9,Newspaper=46))
predict(admode13,data.frame(TV=17.2,Radio=45.9,Newspaper=69.3))
predict(admode13,data.frame(TV=230.1,Radio=37.8,Newspaper=69.2))