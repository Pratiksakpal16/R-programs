library(naivebayes)
data(iris)
i=iris
model_iris <- naive_bayes(Species ~ ., data = i)
model_iris
ipred=predict(model_iris,i)

ti=table(i$Species,ipred)
ai=sum(diag(ti))/sum(ti)
ai
