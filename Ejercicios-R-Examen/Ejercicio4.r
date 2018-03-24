#******************************************
#               EJERCICIO 4
#******************************************

# Recopilamos los datos que tenemos en el enunciado
v0 <- 7
y0 <- 15
x0 <- 0
x1 <- 11
angulo <- 50
g <- 9.8

# Descomponemos la velocidad en sus ejes
v0x <- cos(angulo)*v0
v0y <- sin(angulo)*v0

# Despejamos las funciones del enunciado, teniendo en cuenta que x0 es 0
# Recorremos el bucle de 0.5 en 0.5, desde 0.5 a 11
# j lo usamos para guardar todos los valores de las alturas
alturas <- c(y0)
j <- 2
for(i in seq(0.5, 11, by=0.5)){
  t <- i/v0x
  y <- ((-1/2)*g)*t^2 + v0y*t + y0
  alturas[j] <- y
  j = j+1
}

# Imprimo las alturas
print(alturas)

# Para una mallor claridad, creo un data frame con las coordenadas y lo imprimo
datos <- data.frame(x=seq(0, 11, by=0.5), y=alturas)
print(datos)