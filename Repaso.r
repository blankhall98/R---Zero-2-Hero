### REPASO EN R! ###

## Variables

numero <- 18 #int
name <- 'Jonatan' #char
numero_decimal <- 18.5 #float

#operaciones de variables
numero*5

numero*numero_decimal

## Vectores
v1 <- c('Jonatan','Sofy','Ale','Tomás','Raúl')
v2 <- c(24,21,31,28,16)
v3 <- c('Matemático','Médico','Bailarin','Ingeniero','Chef')

## ciclos
for(name in v1){
  print(name)
}

for(i in 1:length(v1)){
  print(v1[i])
}

## condicionales
5 > 3

7237283*87837/2837283 > 9273289732/83718^2

presupuesto <- 100

costo_articulo <- 11

if(presupuesto >= costo_articulo){
  print('Si te alcanza')
  cambio = presupuesto - costo_articulo
  print(paste('Tu cambio es $',cambio))
}else{
  print('No te alcanza')
  faltante = costo_articulo - presupuesto
  print(paste('Te hace falta $',faltante))
}

## ejemplo 1
for(i in 1:length(v1)){
  if(v2[i] %% 2 == 0){
    print(paste(v1[i],"Tiene edad par:",v2[i]))
  }else{
    print(paste(v1[i],"Tiene edad impar:",v2[i]))
  }
}

### funciones
par_impar <- function(numero){
  if(numero %% 2 == 0){
    print('Par')
  }else{
    print('Impar')
  }
}

par_impar(10)

for(e in v2){
  par_impar(e)
}

### gráficas sencillas
edades <- c(17:75)

salario <- 1500 + 25*edades 

plot(edades,salario)

## aleatoriedad
rnorm(10,mean=24,sd=1)

salario <- 1500 + 25*edades + rnorm(n=length(edades),mean=0,sd=250)

plot(edades,salario)

exp1 <- data.frame(
  'edades' <- edades,
  'salario' <- salario
)

#regresion lineal
modelo1 <- lm(data=exp1,salario ~ edades)

summary(modelo1)

## Graficas Chingonas
library(ggplot2)

g_exp1 <- ggplot(data=exp1) + 
  geom_point(aes(x=edades,y=salario)) +
  ggtitle('Muestreo salario - Edad','Ciudad de México, 2022')+
  geom_smooth(aes(x=edades,y=salario))

g_exp1

## Manejo de datos
library(dplyr)
data()

data(chickwts)

summary(chickwts)

g_chicken <- ggplot(data=chickwts) +
  geom_boxplot(aes(x=feed,y=weight))

g_chicken

pollos_gordos <- chickwts %>% filter(weight > 323.5)

g_gordo <- ggplot(data=pollos_gordos)+
  geom_bar(aes(x=feed))
g_gordo

base_aumentada <- chickwts %>% mutate(new_col = weight/max(weight))

g_aumentada <- ggplot(data=base_aumentada)+
  geom_point(aes(x=weight,y=new_col,col=feed))+
  geom_smooth(aes(x=weight,y=new_col))

g_aumentada
