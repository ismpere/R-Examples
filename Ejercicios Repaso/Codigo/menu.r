#******************************************
#             EJERCICIO MENU
#******************************************

# Hacer un menu que nos de las siguientes opciones:
# 0 -> Finaliza el programa
# 1 -> Matriz justificada a la izquierda
# 2 -> MCD de dos numeros
# 3 -> Intercambia letras de una palabra

leeMatriz = function(){
  # Pedimos al usuario el vector de columnas
  prompt <- "Introduzca las columnas (lista separada por espacios) \n"
  columnas <- as.numeric(strsplit(readline(prompt), " ")[[1]])
  return(columnas)
}

# Imprime la matriz justificada a la izquierda
imprimeMatriz = function(x){
  maximo <- max(x)
  for(i in x){
    x0 <- (maximo-i)%/%2
    if(x0>0){
      for(j in seq(x0)){
        cat(" ")
      } 
    }
    for(k in seq(i)){
      cat("*")
    }
    cat("\n")
  }
  return(1)
}

leeNumeros = function(){
  # Pedimos al usuario el vector de columnas
  numeros <- c()
  while(length(numeros)!=2){
    prompt <- "Introduzca los dos numeros (lista separada por espacios) \n"
    numeros <- as.numeric(strsplit(readline(prompt), " ")[[1]]) 
    if(length(numeros)!=2){
      cat("Ha introducido un numero incorrecto de numeros\n\n")
    }
  }
  return(numeros)
}

# Algoritmo de Euclides
MCD <- function(x){
  rk_1 <- x[1];
  rk_2 <- x[2];
  # Formula recurrente:  r_k =  r_k-1 modulo r_k-2
  # Incrementa k hasta que r_k-2 == 0 
  while(rk_2 != 0) {
    rk      <- rk_1%%rk_2; # remainder
    rk_1    <- rk_2;       # proceed in recurrence
    rk_2    <- rk;
  }
  cat(paste("El MCD de ", x[1], " y ", x[2], " es: ", rk_1, "\n\n"))
  return(1)
}

cambiaLetras <- function(){
  # Pedimos al usuario el string
  prompt <- "Introduzca la frase: \n"
  frase <- readline(prompt)
  
  # Creamos los grupos de valroes, mayusculas y minusculas
  val1 <- 65:90
  val2 <- 97:122
  
  # Obtenemos los valores en ascii de cada letra
  valores <- as.numeric(charToRaw(frase))
  for(i in seq(length(valores))){
    val <- valores[i]
    if(val %in% val1){
      valores[i] <- val + 32
    }else if(val %in% val2){
      valores[i] <- val - 32
    }
  }
  cat(paste(intToUtf8(valores), "\n\n"))
  return(1)
}


#******************************************
#           PROGRAMA PRINCIPAL
#******************************************
opcion <- -1
while(opcion!=0){
  # Informamos al usuario de las posibilidades del menu
  opciones <- c("Elija la opcion que desee:\n",
                "0 -> Finaliza el programa\n",
                "1 -> Matriz justificada\n",
                "2 -> MCD\n",
                "3 -> Intercambia letras\n")
  cat(opciones)
  prompt <- "Opcion: "
  opcion <- as.integer(readline(prompt), " ")
  
  #Hacemos un switch con las opciones del menu
  
  op <- toString(opcion)
  result <- switch(EXPR=op,
            "0"=cat("Finaliza el programa\n"),
            "1"=imprimeMatriz(leeMatriz()),
            "2"=MCD(leeNumeros()),
            "3"=cambiaLetras(),
            cat("No es una opcion valida\n\n"))
}
