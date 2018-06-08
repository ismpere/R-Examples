#################################################
#                   CON BUCLES                  #
#################################################
mcm1 = function(a, b){
  mul <- max(a,b)
  
  # Para que mul sea multiplo de a y b, tiene que haber un valor por el cual se ha multiplicado a ambos,
  # dando un resultado entero, por lo que la division de a y b por dicho número que los ha multiplicado, no tiene decimales
  while(mul%%a != 0 || mul%%b != 0){
    mul <- mul +1
  }
  
  return(mul)
}

#################################################
#                 CON VECTORES                 #
#################################################

mcm2 = function(a, b){
  l <- max(a,b):(a*b)
  
  # El & es porque es una intersección de vectores, si fueran &&, seria una union
  # Con esto sacamos todos los multiplos comunes a ambos numeros
  mul <- l[l%%a==0 & l%%b==0]
  
  return (min(mul))
}

#################################################
#                  CON APPLY                    #
#################################################

multiplo = function(x,a,b){
  if(x%%a==0 && x%%b==0){
    return(x)
  }
  return(NA)
}


mcm3 = function(a, b){
  l <- sapply(max(a,b):(a*b), multiplo, a, b)
  print(l)
  return(min(l, na.rm=TRUE))
}