install.packages("knitr",dependencies = TRUE)



x<-c(1:10)
y<-c(10:20)
z<- cbind(x,y)
a<- as.data.frame(z)
#install.packages("tidyverse")
library(tidyverse)
write_csv(a, "data.csv")

#Controlando el flujo usando sentencias lógicas

x<- 2
if(x > 5){
  print("x es mayor que 5")
}else{
  print("x es menor que 5")
}

suma <- function(x, y) {
  resultado <- x + y
  return(resultado)
}


suma(x=4, y=6)

medio <- function(a, b) {
  medio <- (a + b) / 2
  cat("El punto medio de los valores", a, "y", b,
      "ingresados es", medio)
}
