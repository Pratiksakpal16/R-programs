drinksdf=read.csv("C:/Users/Shrutika/Desktop/rprograms/dataset/drinks2.csv")
View(drinksdf)
attributes(drinksdf)
beer=drinksdf$beer_servings
b=sum(beer)
spirit=drinksdf$spirit_servings
s=sum(spirit)
wine=drinksdf$wine_servings
w=sum(wine)

x=c(b,s,w)
labels=c('Beer','Spirit','Wine')
png(file='drinks1.jpg')
pie(x,label,main='Drinks pie chart',col=rainbow(length(x)))
legend("topright",c("Beer","Spirit","Wine"),cex=0.8,fill=rainbow(length(x)))

dev.off()

png(file='drinks2.jpg')

barplot(x,xlab="Drinks",ylab="Total",names.arg=labels,col=rainbow(length(x)))

png(file='drinks2.jpg')

barplot(x,xlab="Drinks",ylab="Total",names.arg=labels,col=rainbow(length(x)))

dev.off()

png(file="LineChart2.jpg")
plot(x,type="0")
dev.off()

country=drinksdf$country
a=head(country)
colors=c("green","blue","red")
months=c("Jun","Jul","Aug","Sept","Oct")
regions=c(b,s,w)

ba=drinksdf$beer_servings
bhead=head(ba)

sa=drinksdf$spirit_servings
shead=head(sa)
shead
wa=drinksdf$wine_servings
whead=head(wa)
whead
Values=matrix(c(bhead,shead,whead),nrow=3,ncol=6,byrow=TRUE)
Values
png(file='drinks5.jpg')
b=head(drinksdf$total_litres_of_pure_alcohol)
barplot(Values,xlab="Country",ylab="Drinks",names.arg=a,col=colors)
dev.off()



