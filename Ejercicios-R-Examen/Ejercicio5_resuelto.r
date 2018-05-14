#******************************************
#               EJERCICIO 5
#******************************************

nombres <- c("Honda Civic", "Ford Focus", "Seat Ibiza", "Volkswagen Golf", "Kia Pro Ceed",
             "Seat Leon", "Ford Fiesta", "Volkswagen Polo", "Audi A3", "BMW M1")
potencias <- c(136, 115, 120, 150, 140, 138, 90, 105, 160, 185)
gastos <- c(4.3, 4.5, 4.2, 5.9, 5.1, 4.9, 3.8, 4.5, 6.1, 6.3)

#******************************************
#                Apartado A
#******************************************

# Este apartado consiste en primer paso, crear un data frame con los datos dados,
# y calcular la media de potencia de los 5 coches con mas potencia a partir de dicho data frame

coches <- data.frame(Nombre=nombres, Potencia=potencias, Gasto=gastos)

# Ordeno en orden decreciente las potencias, y me quedo solo con las 5 primeras
potencias_ordenadas <- sort(coches$Potencia, decreasing = TRUE)[1:5]

# Calculo la media de dichas potencias y la imprimo
media <- mean(potencias_ordenadas)

print(media)


#******************************************
#                Apartado B
#******************************************

# Este apartado consiste en primer paso, crear un nuevo dato que sea rendimiento,
# el cual esta marcado por el cociente potencia/gasto, añadirlo al data frame
# e imprimir el nombre del coche con mayor rendimiento

# Creo el nuevo valor del data frame con el cociente antes descrito
coches$Rendimiento <- coches$Potencia / coches$Gasto

# Creo otro data frame a partir del anterior, ordenando sus filas (por eso hay una coma y despues nada) 
# en orden descendente (de ahi que tenga un signo negativo el atributo por el que ordeno)
coches_ordenados <- coches[order(-coches$Rendimiento),]

# Al haberlo dejado ordenado por el rendimiento, imprimo el primer nombre, ya que es el que tiene 
# un mayor rendimiento
print(coches_ordenados$Nombre[1])