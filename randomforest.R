data("iris")

str(data)
data$Class=as.factor(data$Class)
table(data$Class)

set.seed(123)
ind=sample(2,nrow(data),replace=TRUE,prob=c(0.7,0.3))
a=sample(1:nrow(data), nrow(data)*0.7)
train=data[a,]
test=data[-a,]
na.omit(data)

library(randomForest)
set.seed(222)
rf=randomForest(Class~., data=train)
t=rf$confusion[,-4]
1-sum(diag(t))/sum(t)

rf1=randomForest(Class~., data=train,
                    ntree = 300,
                    mtry = 8,
                    importance = TRUE,
                    proximity = TRUE)
print(rf1)
attributes(rf)

p1=predict(rf, train)
t1=table(p1, train$NSP)
acc1=sum(diag(t1))/sum(t1)
acc1

p2=predict(rf, test)
confusionMatrix(p2, test$NSP)
t2=table(p2, test$NSP)
acc2=sum(diag(t2))/sum(t2)
acc2

p3=predict(rf1, test)
t3=table(p3, test$NSP)
acc3=sum(diag(t3))/sum(t3)
acc3

rf2=randomForest(Class~., data=train,
                    ntree = 1,
                    mtry = 1,
                    importance = TRUE,
                    proximity = TRUE)
p4=predict(rf2, test)
t4=table(p4, test$NSP)
acc4=sum(diag(t4))/sum(t4)
acc4

plot(rf1)

t=tuneRF(train[,2:4], train[,2:4],
            stepFactor=0.5,
            plot=TRUE,
            ntreeTry=300,
            trace=TRUE,
            improve=0.05)


hist(treesize(rf1),
     main="No. of Nodes for the Trees",
     col="green")

varImpPlot(rf,
           sort=T,
           n.var=10,
           main="Top 10-Variable Importance")
importance(rf)
varUsed(rf)
head(data)

t1=getTree(rf,1,labelVar=TRUE)

