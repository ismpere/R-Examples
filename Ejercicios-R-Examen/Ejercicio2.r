#******************************************
#               EJERCICIO 2
#******************************************

# Primero creamos los vectores que almacenan
# los datos del data frame
estados <- c("Soltero", "Casado", "Viudo", "Divorciado")
e1 <- c(31,45,35,65,21,38,62,22,31)
e2 <- c(62,39,62,59,21,62,NA,NA,NA)
e3 <- c(80,68,65,40,78,69,75,NA,NA)
e4 <- c(31,65,59,49,65,NA,NA,NA,NA)
edades <- list(e1,e2,e3,e4)

datos <- data.frame(Estado_civil=estados, Edad=cbind(edades))

#******************************************
#                Apartado A
#******************************************

# Guardo los valores de las medias de todas las edades de cada estado
medias <- c()
for(i in 1:length(datos$edades)){
  medias[i] <- mean(unlist(datos$edades[i], use.names = FALSE), na.rm = TRUE)
}

# Guardo los valores de las desviaciones tipicas de todas las edades de cada estado
des.tipicas <- c()
for(i in 1:length(datos$edades)){
  nulos <- length(is.na(unlist(datos$edades[i], use.names = FALSE)))
  tam <- length(datos$edades[i])-nulos
  cuasi.desv <- sd(unlist(datos$edades[i], use.names = FALSE), na.rm = TRUE)
  des.tipicas[i] <- ((tam-1)/tam) * cuasi.desv
}

# Guardo los valores de las skewness de todas las edades de cada estado
skewnesses <- c()
for(i in 1:length(datos$edades)){
  skewnesses[i] <- skewness(unlist(datos$edades[i], use.names = FALSE), na.rm = TRUE)
}

# Guardo los valores de las kurtosis de todas las edades de cada estado
kurtosises <- c()
for(i in 1:length(datos$edades)){
  kurtosises[i] <- kurtosis(unlist(datos$edades[i], use.names = FALSE), na.rm = TRUE)
}

# Almaceno las nuevas medidas como columnas del data frame
datos$Media <- medias
datos$DesvTipica <- des.tipicas
datos$Skewness <- skewnesses
datos$Kurtosis <- kurtosises