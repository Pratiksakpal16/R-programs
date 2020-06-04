set.seed(123)
ind=sample(2,nrow(wdf),replace=TRUE,prob=c(0.7,0.3))
train=wdf[ind==1,]
test=wdf[ind==2,]

library(randomForest)
set.seed(90)
rf=randomForest(Type~.,data=wdf)

rf1=randomForest(Type~.,data=train,ntree=300,importance=TRUE,proximity=TRUE)
print(rf1)
attributes(rf1)

randomForest(Type~.,data=train)

library(caret)
p1=predict(rf.test)
t1=table(p1,test$Type)
t1
acc=sum(diag(t1))/sum(t1)
acc

p2=predict(rf,train)
t2=table(p2,train$Type)
t2
acc2=sum(diag(t2))/sum(t2)
acc2

t=tuneRF(train[,-5],train[,5],stepFactor = 0.5,plot = TRUE,trace = TRUE,improve = 0.05)

hist(treesize(rf1),main="No of nodes of trees",col="green")
randomForest(mt)

varImpPlot(rf,sort=T,n.var = 10,main = "Top 10-variable importance")

importance(rf)
varUsed(rf)
head(data)

t=getTree(rf,1,labelVar = TRUE)