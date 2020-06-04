num=as.numeric(readline("enter a no."))
z=0
while(z==0){
  for (i in 1:11){
    print(paste(num,"x",i,"=",num*z))
}
b=readline("do u want to continue?\n yes:0 no:1\n")  
z=as.numeric(b)
}
