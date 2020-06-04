library(plyr)
moviesdf=read.csv("C:/Users/Shrutika/Desktop/rprograms/dataset/P4-Movie_Ratings.csv")
View(moviesdf)
unique(moviesdf$Genre)

r1=data.frame()
r2=data.frame()
r3=data.frame()
r4=data.frame()
r5=data.frame()
r6=data.frame()
r7=data.frame()

for (i in 1:nrow(moviesdf)){
  if(moviesdf$Genre[i]=='Comedy')
  r1=rbind(r1,moviedf[i,])
}else if(moviesdf$Genre[i]=='Action'){
  r2=rbind(r2,moviedf[i,])
}else if(moviesdf$Genre[i]=='Adventure'){
  r3=rbind(r3,moviedf[i,])
}else if(moviesdf$Genre[i]=='Horror'){
  r4=rbind(r4,moviedf[i,])
}else if(moviesdf$Genre[i]=='Drama'){
  r5=rbind(r5,moviedf[i,])
}else if(moviesdf$Genre[i]=='Comedy'){
  r6=rbind(r6,moviedf[i,])
}else{
  r7=rbind(r7,moviesdf[i,])
 }
}
View(r1)
pie(count(r1,vars='Year.of.release'))
x=count(r1,vars='Year.of.release')
View(x)
pie(x$freq,names.arg=x$Year.of.release)
barplot(x$freq,names.arg=x$Year.of.release)

View(r2)
y=(count(r2,vars='Year.of.release'))
y
pie(x$freq,names.arg=y$Year.of.release)
barplot(y$freq,names.arg=y$Year.of.release)

View(r3)
z=(count(r3,vars='Year.of.release'))
z
pie(z$freq,names.arg=z$Year.of.release)
barplot(z$freq,names.arg=z$Year.of.release)

View(r4)
p=(count(r4,vars='Year.of.release'))
p
pie(p$freq,names.arg=p$Year.of.release)
barplot(p$freq,names.arg=p$Year.of.release)

View(r5)
q=(count(r5,vars='Year.of.release'))
q
pie(q$freq,names.arg=q$Year.of.release)
barplot(q$freq,names.arg=q$Year.of.release)

View(r6)
r=(count(r6,vars='Year.of.release'))
r
pie(r$freq,names.arg=r$Year.of.release)
barplot(r$freq,names.arg=r$Year.of.release)

View(r7)
s=(count(r7,vars='Year.of.release'))
s
pie(s$freq,names.arg=s$Year.of.release)
barplot(s$freq,names.arg=s$Year.of.release)

u=unique(moviedf$Genre)
view(u)

for (i in 1:length(u)){
  newdf=data.frame()
  for(j in 1:nrow(moviedf)){
    if (moviedf$Genre[j]==u[i]){
      newdf=rbind(newdf,moviedf[j,])
    }
  }
}
view(newdf)
