Construcción de Compendios de Investigación
================

## Usar proyectos de Rstudio

Mantenga su trabajo ordenado, portátil y autónomo

## El paquete here

Use la función here::here(‘ruta’, ‘a’, ‘archivo’) para crear rutas
robustas relativas a la raíz del proyecto.

``` r
here::here("path", "to", "file")
```

    ## [1] "/home/mat15063/Documents/workflow/upwell-worshop/path/to/file"

## Aproveche las herramientas y la funcionalidad para el desarrollo de paquetes R

-   administrar dependencias

-   hacer que la funcionalidad esté disponible

-   funcionalidad del documento

-   validar funcionalidad

-   control de versiones de su proyecto

## Proyecto de análisis mínimo

Un directorio scripts/ que contiene scripts R (.R), cuadernos (.Rmd) y
datos intermedios.

Un archivo DESCRIPCIÓN que proporciona metadatos sobre el compendio. Lo
que es más importante, enumeraría los paquetes necesarios para ejecutar
el análisis. Contendría un campo para indicar que se trata de un
análisis, no de un paquete.

## Un proyecto de análisis reproducible también contendría:

Un directorio R/ que contiene archivos R que proporcionan funciones de
alto riesgo.

Un directorio data/ que contiene datos importantes.

Un directorio tests/ que contiene pruebas unitarias para el código y los
datos.

Un directorio vignettes/ que contiene informes importantes.

## Componentes autogenerados:

Un directorio man/ que contiene documentación generada por roxygen2 para
las funciones y datos reutilizables.

Documentación en línea en una carpeta docs/.

## Un proyecto de análisis reproducible compartible también:

Use Git + GitHub (u otro host público de Git)

Utilice Travis u otro servicio de integración continua

Capture el entorno computacional para que pueda recrearse fácilmente en
una computadora diferente. Esto implica, como mínimo, capturar las
versiones del paquete, pero también puede incluir la captura de la
versión R y otras dependencias externas.

# rrtools: compendios de investigación en R

El objetivo de rrtools es proporcionar instrucciones, plantillas y
funciones para crear un compendio básico adecuado para escribir
investigaciones reproducibles con R.

rrtools se extiende y funciona con varios paquetes de R:

-   devtools: funciones para el desarrollo de paquetes

-   usethis: automatiza las tareas repetitivas que surgen durante la
    configuración y el desarrollo del proyecto

-   bookdown: facilita la escritura de libros y artículos/informes de
    formato largo con R Markdown

## Cree su primer compendio de investigación reproducible

### Install packages

``` r
# install rrtools
install.packages("devtools")
devtools::install_github("benmarwick/rrtools")

# install github dependencies
dependencies <- c("dplyr", "ggplot2", "ggthemes", "gitcreds", "rticles", "Cairo")

# install CRAN dependencies
install.packages(dependencies)

#install github dependencies
devtools::install_github("crsh/citr")

# install tinytex
tinytex::install_tinytex()
```

## Create compendium

First we need to load rrtools

``` r
library(rrtools)
```

Ahora estamos listos para crear nuestro compendio. Usamos la función
rrtools::create_compendium y le proporcionamos una ruta en la que se
creará nuestro compendio. La parte final de nuestro camino se convierte
en el nombre del compendio. Debido a que la función crea efectivamente
un paquete, solo se acepta como nombre una única cadena de caracteres
alfabéticos en minúsculas. así que optemos por **upwellcompendium** como
la parte final de nuestro camino.

Para crear rrcompendium en nuestro proyecto, uso:

``` r
library(usethis)
# Inicia el compendio como un proyecto
rrtools::create_compendium("~/Documents/workflow/upwellcompendium")
# Iniciar el control de versiones
usethis::use_git()
usethis::use_github()
```
