# PASO 1. Importar el Dataset colocando la ubicaci?n del .csv en el read csv

file.choose()

base_de_datos <- read.csv("C:\\Users\\Usuario\\Desktop\\IN 20-21\\Trabajo\\Dataset\\DB_Bicis_RStudio.csv")

# PASO 2. Comprobar que se ha importado correctamente la base de datos

muestra <- summary(base_de_datos)
muestra

# PASO 3. Mostrar una gr?fica que permita entender la relaci?n entre la temperatura y los beneficios totales

plot(base_de_datos$temperatura, base_de_datos$beneficios_totales, main = "Relaci?n entre la temperatura y los beneficios totales", xlab = "Temperatura", ylab = "Beneficios totales")

# PASO 4. Generar la regresi?n lineal

regresion <- lm(beneficios_totales ~ hora + dia + mes + a?o + estacion + dia_de_la_semana + descanso + temperatura + sensacion_termica + humedad + velocidad_del_viento, data = base_de_datos)
summary(regresion)
                
# PASO 5. Ajustar la regresi?n lineal

regresion <- lm(beneficios_totales ~ hora + mes + a?o + sensacion_termica + humedad + velocidad_del_viento, data = base_de_datos)
summary(regresion)

# PASO 6. Realizar modelo predictivo

datos <- data.frame(hora = 12, mes = 1:12, a?o = 2020, sensacion_termica = 24, humedad = 62, velocidad_del_viento = 13)

# predict() devolver? el n?mero de bicicletas que se van a vender en 2020 con los datos introducidos en el data.frame()

predict(regresion, datos)
