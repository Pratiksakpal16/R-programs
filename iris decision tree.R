data(iris)
head(iris)

fitTree=rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,iris)

newdata=data.frame(Sepal.Length=7,Sepal.Width=4,Petal.Length=6,Petal.Width=2)
newdata

predict(fitTree, newdata,type="class")

newdata2=data.frame(Sepal.Length=c(7,8,6,5),
                     Sepal.Width=c(4,3,2,4),
                     Petal.Length=c(6,3.4,5.6,6.3),
                     Petal.Width=c(2,3,4,2.3))
newdata2

predict(fitTree,newdata2,type="class")
rpart.plot(fitTree)
