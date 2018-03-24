#******************************************
#               EJERCICIO 1
#******************************************

# Primero creamos los vectores que almacenan
# los datos del data frame

nombres <- c("Jose Luis Martinez Izquierdo", "Rosa Diaz Diaz", "Javier Garcia Sanchez",
            "Carmen Lopez Pinzon", "Marisa Lopez Collado", "Antonio Ruiz Cruz")

sexos <- c("H", "M", "H", "M", "M", "H")

pesos <- c(85,65,71,65,51,66)

alturas <- c(179,173,181,170,158,174)

colesteroles <- c(182,232,191,200,128,249)

# Ahora creamos el data frame con los vectores anteriores renombrando las columnas
datos <- data.frame(Nombre=nombres, Sexo=sexos, Peso=pesos,
                   Altura = alturas, Colesterol = colesteroles, stringsAsFactors=FALSE)

# Lo guardamos en el fichero colesterol.txt, indicando la ruta de ese fichero que vamos a crear
write.table(datos,"~/Documentos/GitRepos/R-examples/Ejercicios-R-Examen/colesterol.txt",sep="\t",row.names=FALSE)

# Leemos el data frame del fichero y lo guardamos en datos
datos <- read.table("~/Documentos/GitRepos/R-examples/Ejercicios-R-Examen/colesterol.txt", header = TRUE, stringsAsFactors=FALSE)


#******************************************
#                Apartado A
#******************************************

# Pedimos al usuario el vector de edades y lo almacenamos en edades
prompt <- "Introduzca las edades de los sujetos (lista separada por espacios) \n"
edades <- as.numeric(strsplit(readline(prompt), " ")[[1]])

# Tambien se puede hacer con datos["Edad"] <- edades, o datos[["Edad"]] <- edades
datos$Edad <- edades

# Lo volvemos a guardar en el fichero
write.table(datos,"~/Documentos/GitRepos/R-examples/Ejercicios-R-Examen/colesterol.txt",sep="\t",row.names=FALSE)

#******************************************
#                Apartado B
#******************************************

# Como los datos de la fila son de distinto tipo, usamos una lista y lo añadimos como una nueva fila al data frame
nuevoDato <- list("Cristobal Campos Ruiz", "H", 70, 178, 220, 44)
datos[nrow(datos) + 1,] <- nuevoDato

#******************************************
#                Apartado C
#******************************************

# Obtenemos Las columnas que deseamos del data frame y hacemos calculos con ellas
IMC <- datos$Peso / (datos$Altura/100)^2

#******************************************
#                Apartado D
#******************************************

# Declaro el nuevo vector vacio, y mediante un for recorro los IMC y asigno los valores al nuevo vector
IMC2 <- c()
for(i in 1:length(IMC)){
  imc <- IMC[i]
  if(imc<18.5) IMC2[i] <- "Bajo peso"
  else if(imc<24.5) IMC2[i] <- "Saludable"
  else if(imc<30) IMC2[i] <- "Sobrepeso"
  else IMC2[i] <- "Obeso"
}

#******************************************
#                Apartado E
#******************************************

# Filtro las filas del data frame mediante una condicion booleana en su sexo
datos2 <- datos[datos$Sexo == "H",]

# Si quisieramos eliminar una columna del data frame
datos2$Sexo <- NULL
