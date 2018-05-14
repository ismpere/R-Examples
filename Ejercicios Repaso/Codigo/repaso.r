#******************************************
#            EJERCICIO REPASO
#******************************************

nombres <- c("Ana", "Javi", "Pedro", "Lucia", "Natalia", "Pilar")

notas <- list(c(5,5,4,5), c(8,9,9,10), c(10,10, 6,5), c(0,0,1,9), c(4,4,8,6), c(3,4,7,7))

#******************************************
#                Apartado A
#******************************************

# Crear un data frame con la mejor nota y la nota media de cada uno

medias <- c()
for(i in seq(length(notas))){
  medias[i] <- mean(notas[[i]])
}

maximas <- c()
for(i in seq(length(notas))){
  maximas[i] <- max(notas[[i]])
}
notas <- data.frame(Nombre=nombres, Media=medias, Maxima=maximas)

# Ordeno en orden decreciente las potencias, y me quedo solo con las 5 primeras
mayor_media <- sort(notas$Media, decreasing = TRUE)[1]
print(mayor_media)


#******************************************
#                Apartado B
#******************************************

# Este apartado consiste en primer paso, crear un nuevo dato que sea eficiencia,
# el cual esta marcado por el cociente maxima_nota/media, añadirlo al data frame
# e imprimir el nombre de la persona con mayor eficiencia

# Creo el nuevo valor del data frame con el cociente antes descrito
notas$Eficiencia <- notas$Maxima / notas$Media

# Creo otro data frame a partir del anterior, ordenando sus filas (por eso hay una coma y despues nada) 
# en orden descendente (de ahi que tenga un signo negativo el atributo por el que ordeno)
notas_ordenadas <- notas[order(-notas$Eficiencia),]

# Al haberlo dejado ordenado por la eficiencia, imprimo el primer nombre, ya que es el que tiene 
# un mayor rendimiento
print(notas_ordenadas$Nombre[1])
