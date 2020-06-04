{a=as.numeric(readline("enter 1st no."))
b=as.numeric(readline("enter 2nd no."))
opr=readline("enter the operation:add/sub/mul/div")
c=0}

if(opr=="add"){
  c=a+b
  paste("result is:",as.character(c))
}else if(opr=="sub"){
  c=a-b
  paste("result is:",as.character(c))
}else if(opr=="mul"){
  c=a*b
  paste("result is:",as.character(c))
}else if(opr=="div"){
    c=a/b
  paste("result is:",as.character(c))
}else{
    print("error")
}

