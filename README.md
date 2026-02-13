# Proyecto 1: Análisis Exploratorio de Datos - Divorcios en Guatemala

Este proyecto contiene un análisis exploratorio de los registros de divorcios en Guatemala del Instituto Nacional de Estadística (INE), abarcando el período 2013-2022.

## Estructura del Proyecto

```
proyecto1-analisis-exploratorio/
├── load_data.R              # Script de carga y preprocesamiento de datos
├── Proyecto1.Rmd            # Documento principal del análisis
└── data/                    # Carpeta con archivos de datos
    ├── divorcios_2013.sav
    ├── divorcios_2014.sav
    ├── divorcios_2015.sav
    ├── divorcios_2016.sav
    ├── divorcios_2017.sav
    ├── divorcios_2018.sav
    ├── divorcios_2019.sav
    ├── divorcios_2020.sav
    ├── divorcios_2021.sav
    └── divorcios_2022.sav
```

## Instrucciones de Uso

### 1. Requisitos Previos

Asegúrate de tener R y RStudio instalados en tu sistema. El proyecto requiere las siguientes librerías de R:

- `haven` - Para leer archivos .sav de SPSS
- `dplyr` - Para manipulación de datos
- `purrr` - Para programación funcional
- `janitor` - Para limpieza de nombres de variables
- `stringr` - Para manipulación de cadenas de texto
- `psych` - Para estadísticas descriptivas
- `knitr` - Para generación de reportes
- `ggplot2` - Para visualización de datos
- `corrplot` - Para matrices de correlación
- `gridExtra` - Para organizar gráficos
- `moments` - Para cálculo de momentos estadísticos

### 2. Orden de Ejecución

**IMPORTANTE: Ejecutar en este orden**

#### Paso 1: Carga y Preprocesamiento de Datos
Primero ejecuta el script de carga de datos:
```r
source("load_data.R")
```

Este script:
- Instala automáticamente las librerías faltantes
- Carga todos los archivos .sav de la carpeta `data/`
- Unifica y limpia los datos de diferentes años
- Estandariza las variables entre archivos
- Genera el dataset consolidado `divorcios`

#### Paso 2: Análisis Completo
Después ejecuta el documento principal:
```r
# En RStudio, abrir Proyecto1.Rmd y hacer "Knit"
# O desde consola:
rmarkdown::render("Proyecto1.Rmd")
```

### 3. Contenido del Análisis

El documento `Proyecto1.Rmd` incluye:

- **Descripción del conjunto de datos**: Información general sobre los `r nrow(divorcios_limpio)` registros
- **Diccionario de variables**: Explicación de las 19 variables principales
- **Análisis de variables numéricas**: 
  - Estadísticas descriptivas (tendencia central, dispersión)
  - Análisis de distribución y detección de outliers
  - Visualizaciones (histogramas, diagramas de caja)
- **Análisis de variables categóricas**:
  - Tablas de frecuencia por departamento, municipio, mes
  - Distribución de escolaridad y pertenencia étnica
- **Análisis de relaciones**: Correlaciones entre variables numéricas

### 4. Archivos de Salida

El análisis genera:
- `Proyecto1.html` - Reporte final en formato HTML
- Gráficos y tablas integrados en el documento

## Datos

Los archivos en la carpeta `data/` contienen:
- Registros de divorcios del INE de Guatemala (2013-2022)
- Formato: Archivos .sav (SPSS)
- Variables principales: información demográfica, geográfica y temporal de los divorcios