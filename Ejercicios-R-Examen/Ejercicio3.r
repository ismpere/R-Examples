#******************************************
#               EJERCICIO 3
#******************************************

# Primero pedimos por teclado el numero
n <- readline(prompt="Introduzca un numero: ")
n <- as.numeric(n)

# Mientras lo que halla introducido el usuario no sea un numero
# (ya que el casting a numeric da NA), seguimos pidiendo el numero
while(is.na(n)){
  n <- readline(prompt="Introduzca un numero: ")
  n <- as.numeric(n)
}

# Usamos una variable auxiliar y calculamos el factorial
n_aux <- n
for(i in 1:(n-1)) {
  n_aux <- n_aux*i;
}

# Imprimimos el resultado ayudandonos de la funcion paste
print(paste("El factorial del numero ", n, " es ", n_aux))