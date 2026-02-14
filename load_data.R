paquetes <- c("haven", "dplyr", "purrr", "janitor", "stringr")

instalar_si_falta <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, repos = "https://cloud.r-project.org")
  }
}

invisible(lapply(paquetes, instalar_si_falta))

library(haven)
library(dplyr)
library(purrr)
library(janitor)
library(stringr)


ruta <- "data/"

archivos <- list.files(
  path = ruta,
  pattern = "\\.sav$",
  full.names = TRUE
)

leer_divorcios <- function(archivo) {
  
  datos <- read_sav(archivo) %>%
    janitor::clean_names()
  
  anio_archivo <- as.numeric(str_extract(archivo, "\\d{4}"))
  
  if (!"anioocu" %in% names(datos)) {
    datos <- datos %>%
      mutate(anioocu = anio_archivo)
  }
  
  if ("ciuohom" %in% names(datos)) {
    datos <- datos %>%
      mutate(ciuohom = as.character(ciuohom))
  }
  
  if ("ciuomuj" %in% names(datos)) {
    datos <- datos %>%
      mutate(ciuomuj = as.character(ciuomuj))
  }
  
  return(datos)
}


divorcios <- map_df(archivos, leer_divorcios)


#Limipar nombres de columnas (unificar)
divorcios <- divorcios %>%
  mutate(
    anioocu = coalesce(anioocu, anoocu)
  ) %>%
  select(-anoocu)

divorcios <- divorcios %>%
  mutate(
    puehom  = as.character(puehom),
    pperhom = as.character(pperhom)
  ) %>%
  mutate(
    ocupacion_hom = coalesce( puehom, pperhom)
  ) %>%
  select( -puehom, -pperhom)


divorcios <- divorcios %>%
  mutate(
    puemuj  = as.character(puemuj),
    ppermuj = as.character(ppermuj)
  ) %>%
  mutate(
    ocupacion_muj = coalesce( puemuj, ppermuj)
  ) %>%
  select( -puemuj, -ppermuj)



#Divorcios ahora es el data que contiene todos los divorcios de 2012 hasta 2022
ncol(divorcios)
names(divorcios)









