# EDA functions ----

#' EDA Inspect Data
#'
#' @description
#' Perform inspectdf function and put the results in preformated tables
#'
#' @param df A data frame.
#' @param ... Use tu supply group names for the inspectdf function.
#'
#' @details
#' - Data must have the type fof variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_inspect_types()
#'
#' @export

## 1.0 Types de variables disponibles ----

my_inspect_types<- function(df, ...){
  inspectdf::inspect_types(df) %>%
    knitr::kable(caption = "Types de variables disponibles",
                 col.names=c("Type","Nombre", "Pourcentage", "Nom des variables"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 2.0 Nombre de valeur manquante pour chaque variable ----

my_inspect_na<-function(df, ...){
  inspectdf::inspect_na(df) %>%
    knitr::kable(caption = "Nombre de valeur manquante pour chaque variable",
                 col.names=c("Nom de la variable","NA", "Pourcentage"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 3.0 Résumé et comparaison des variables numériques ----

my_inspect_num<-function(df, ...){
  inspectdf::inspect_num(df) %>%
    dplyr::select(-hist) %>%
    knitr::kable(caption = "Resume et comparaison des variables numeriques",
                 col.names=c("Nom de la variable","min", "q1","median", "moyenne", "q3", "max", "sd", "NA (%)"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 4.0 Coeficient de corrélation pour toutes les variables numériques ----

my_inspect_cor<-function(df, ...){
  inspectdf::inspect_cor(df) %>%
    knitr::kable(caption = "Coeficient de correlation pour toutes les variables numeriques",
                 digits = c(2,2,2,6)) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 5.0 Résumé et comparaison des variables catégotiques ----

my_inspect_cat<-function(df, ...){
  inspectdf::inspect_cat(df) %>%
    dplyr::select(-levels) %>%
    knitr::kable(caption = "Resume et comparaison des variables categotiques",
                 col.names=c("Nom de la variable","Nombre", "Commun","pourcentage"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 6.0 Résumé des catégories les plus utilisées ----

my_inspect_imb<-function(df, ...){
  inspectdf::inspect_imb(df) %>%
    knitr::kable(caption = "Resume des categories les plus utilisees",
                 col.names=c("Nom de la variable","Categorie", "Pourcentage","Nombre"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("striped","condensed"), full_width = F, position = "left")
}
