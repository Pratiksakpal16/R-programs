library(glmnet)
data(swiss)
x_vars=model.matrix(Fertility~.,swiss)[,-1]
y_vars=swiss$Fertility
lambda_seq=10^seq(2,-2,by=-.1)

#Splitting the data into test and train
set.seed(86)
train=sample(1:nrow(x_vars),nrow(x_vars)/2)
x_test=(-train)
y_test=y_vars[train]
cv_output=glmnet(x_vars[train,],y_vars[train],alpha=1,lambda=lambda_seq)
#identifying best lamda
best_lam=cv_output$lambda.min
#Output
#[1]1.995262#
#using this value,let us train the lasso model again.#
#Rebuilding the model with best lamda value identified
lasso_best=glmnet(x_vars[train,],y_vars[train],alpha=1,lambda=best_lam)
pred=predict(lasso_best,s=best_lam,newx=x_vars[train,])

final=cbind(y_vars[train],pred)
head(final)
acc=sum(diag(final))/sum(final)
acc
