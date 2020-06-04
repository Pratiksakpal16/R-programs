demodf=("C:/Users/Shrutika/Desktop/rprograms/dataset/P4-Demographic-Data.csv")
View(demodf)

country=demodf$Country.Name
chead=head(country,10)

birth=demodf$Birth.rate
bhead=head(birth,10)
user=demodf$Internet.users
uhead=head(user,10)
colors=c("orange","red")
months=c("Jun","Jul","Aug","Sep","Oct")
regions=c(birth,user)

Values=matrix(c(bhead,uhead),nrow=2,ncol=10,byrow=TRUE)
Values
png(file='demo1.jpg')

barplot(Values,xlab="Country",ylab="names.arg"=chead,col=colors)
dev.off()