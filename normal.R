pnorm(40,mean=72,sd=15.2,lower.tail = FALSE)
dnorm(70,mean=72,sd=15.2)
q=seq(0,2,by=0.1)
qnorm(q,mean = 1,sd=1)
qnorm(0.5,mean = 1,sd=1)
pnorm(6000,mean = 5000,sd=2000,lower.tail = FALSE)
dnorm(640,mean = mean(faithful$eruptions),sd=sd(faithful$eruptions))
mean(faithful$eruptions)
dnorm(75,mean = 80,sd=15)
qnorm(0.95,mean=100,sd=15)
##Random numbers
set.seed(1)
y=rnorm(6,mean=80,sd=15)
y
library(e1071)