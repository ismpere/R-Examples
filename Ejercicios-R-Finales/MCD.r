#################################################
#                   CON BUCLES                  #
#################################################
MCD1 = function(a, b){
  while(b!=0){
    t <- b
    b <- a %% b
    a <- t
  }
  return(a)
}

#################################################
#                 CON VECTORES                 #
#################################################

MCD2 = function(a, b){
  x <- 1:min(a,b)
  div <- x[a%%x==0 & b%%x==0]
  
  return (max(div))
}

#################################################
#                  CON APPLY                    #
#################################################
divisor = function(x,a,b){
  if(a%%x==0 && b%%x==0){
    return(x)
  }
  return(NA)
}

MCD3 = function(a, b){
  l <- sapply(1:min(a,b),divisor,a, b)
  return(max(l, na.rm = TRUE))
}