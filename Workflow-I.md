Workflow I
================

## Data types, structures and classes

En general, hay 25 tipos de objetos base diferentes.

## Tipos de datos básicos

Hay 5 tipos de datos básicos: double, integer, complex, logical,
character as well as NULL

No importa cuán complicados se vuelvan sus análisis, todos los datos en
R se interpretan como uno de estos tipos de datos básicos.

Puede inspeccionar el tipo de un valor u objeto a través de la función
`typeof()`.

``` r
typeof(3.14)
```

    ## [1] "double"

``` r
typeof(1L)
```

    ## [1] "integer"

``` r
typeof(TRUE)
```

    ## [1] "logical"

## Estructuras de datos

### Vectors

Para comprender mejor la importancia de los tipos de datos y la
coerción, conozcamos un caso especial de una matriz, el vector.

Para crear un nuevo vector use la función vector(). Puede especificar la
longitud del vector con la longitud del argumento y el tipo de datos
base a través del modo de argumento.

``` r
mi_vector <- vector(mode='character', length=3)
mi_vector
```

    ## [1] "" "" ""

``` r
sec2 <- c(1:10)
```

## Matrices

Las longitudes de cada dimensión están definidas por el número de filas
y columnas.

Podemos declarar una matriz llena de ceros:

``` r
matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example
```

    ##      [,1] [,2] [,3] [,4] [,5] [,6]
    ## [1,]    0    0    0    0    0    0
    ## [2,]    0    0    0    0    0    0
    ## [3,]    0    0    0    0    0    0

``` r
dim(matrix_example)
```

    ## [1] 3 6

# Lists

Las listas pueden almacenar objetos de cualquier tipo y clase de datos

Otra estructura de datos clave es la lista. Las listas son la estructura
de datos más flexible porque cada elemento puede contener cualquier
objeto, de cualquier tipo de datos y dimensión, incluidas otras listas.

Cree listas usando list() o coaccione otros objetos usando as.list().

``` r
list(1, "a", TRUE)
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] "a"
    ## 
    ## [[3]]
    ## [1] TRUE

``` r
as.list(1:4)
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] 2
    ## 
    ## [[3]]
    ## [1] 3
    ## 
    ## [[4]]
    ## [1] 4

Podemos nombrar los elementos de la lista:

``` r
a_list <- list(title = "Numbers", numbers = 1:10, data = TRUE )
a_list
```

    ## $title
    ## [1] "Numbers"
    ## 
    ## $numbers
    ##  [1]  1  2  3  4  5  6  7  8  9 10
    ## 
    ## $data
    ## [1] TRUE

## Data.frames

### S3, S4 and S6 objects

Las matrices y las listas son todos tipos base inmutables. Sin embargo,
hay otros tipos de objetos en R.

Estos son objetos de tipo S3, S4 y S6, siendo S3 el más común.

Dichos objetos tienen un atributo de clase (los tipos base también
pueden tener un atributo de clase), lo que permite una funcionalidad
específica de clase, una característica de la programación orientada a
objetos. Los usuarios pueden crear nuevas clases, lo que permite una
mayor flexibilidad en los tipos de estructuras de datos disponibles para
los análisis.

La clase de objeto S3 más importante en R es data.frame. Los marcos de
datos son tipos especiales de listas.

Los data.frame son tipos especiales de listas donde cada elemento es un
vector, cada uno de igual longitud. Entonces, cada columna de un marco
de datos contiene valores de tipo de datos consistente, pero el tipo de
datos puede variar entre columnas (es decir, a lo largo de las filas).

``` r
df <- data.frame(id = 1:3, 
                 treatment = c("a", "b", "b"), 
                 complete = c(TRUE, TRUE, FALSE))
df
```

    ##   id treatment complete
    ## 1  1         a     TRUE
    ## 2  2         b     TRUE
    ## 3  3         b    FALSE

Podemos verificar que nuestro data.frame es una lista debajo del objeto:

``` r
typeof(df)
```

    ## [1] "list"

``` r
class(df)
```

    ## [1] "data.frame"

``` r
sloop::otype(df)
```

    ## [1] "S3"

¿Comparado con un vector?

``` r
sloop::otype(1:10)
```

    ## [1] "base"

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Plots

![](Workflow-I_files/figure-gfm/pressure-1.png)<!-- -->

# La manera tidyverse

## Intro a tidyverse

Tidyverse es un sistema coherente de paquetes para la manipulación,
exploración y visualización de datos que comparten una filosofía de
diseño común.

## Ventajas del Tidyverse

-   Funciones consistentes.

-   Cobertura del flujo de trabajo.

-   Un enfoque parsimonioso para el desarrollo de herramientas de
    ciencia de datos.

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

## Principios de Tidyverse

-   tibbles como principales estructuras de datos.

-   Datos Tidy donde las filas son observaciones individuales y las
    columnas las variables observadas.

-   Canalización (piping) de las salidas de las funciones tidyverse como
    entradas para funciones posteriores.

``` r
install.packages(c("tibble", "dplyr"))
```

    ## Installing packages into '/home/mat15063/R/x86_64-pc-linux-gnu-library/4.2'
    ## (as 'lib' is unspecified)

## tibbles

Los tibbles son una de las características unificadoras del tidyverse, y
son la versión tidyverse de un data.frame (los usaré indistintamente en
el resto del curso).

## Creando nuevos tibbles

``` r
tibble::tibble(
    x = 1:5, 
    y = 1, 
    z = x ^ 2 + y
)
```

    ## # A tibble: 5 × 3
    ##       x     y     z
    ##   <int> <dbl> <dbl>
    ## 1     1     1     2
    ## 2     2     1     5
    ## 3     3     1    10
    ## 4     4     1    17
    ## 5     5     1    26

## 

``` r
# Specify URL where file is stored
url <- "https://www.ncei.noaa.gov/pub/data/paleo/paleolimnology/southamerica/chile/maule2020geochem.txt"

destfile <- "maule2020geochem.txt"

# Apply download.file function in R
download.file(url, destfile)

my_data <- read_tsv("maule2020geochem.txt")

output <- as.data.frame(paste0(gsub("\\.txt$", "", my_data), ".csv"))

my_csvdata <- write_csv(output,"maule2020gch.csv")
```
