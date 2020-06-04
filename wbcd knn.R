library(class)

View(wbcd)
wbcd=wbcd[-1] 

table(wbcd$diagnosis) 

wbcd_n=as.data.frame(lapply(wbcd[2:31],normalize))

wbcd_train=wbcd_n[1:469,]
wbcd_test=wbcd_n[470:569,]

wbcd_train_d=wbcd[1:469,]
wbcd_test_d=wbcd[470:569,]

model=knn(wbcd_train,wbcd_test,cl=wbcd_train_d$diagnosis,k=21)
model
a=table(model,wbcd_test_d$diagnosis)
a
accuracy=sum(diag(a)/sum(a))
accuracy

