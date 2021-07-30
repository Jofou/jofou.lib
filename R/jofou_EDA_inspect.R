# EDA functions ----

## 1.0 Types de variables disponibles ----

#' EDA Inspect Data Types
#'
#' @description
#' Perform some [inspectdf](https://github.com/alastairrushworth/inspectdf) package function and put the results in preformated tables.
#'
#' @param df A data frame.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_inspect_types()
#'
#' @export
my_inspect_types<- function(df){
  inspectdf::inspect_types(df) %>%
    knitr::kable(caption = "Types de variables disponibles",
                 col.names=c("Type","Nombre", "Pourcentage", "Nom des variables"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 2.0 Nombre de valeur manquante pour chaque variable ----
#' EDA Inspect NA
#'
#' @description
#' Perform some [inspectdf](https://github.com/alastairrushworth/inspectdf) package function and put the results in preformated tables.
#'
#' @param df A data frame.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_inspect_na()
#'
#' @export
my_inspect_na<- function(df){
  inspectdf::inspect_na(df) %>%
    knitr::kable(caption = "Nombre de valeur manquante pour chaque variable",
                 col.names=c("Nom de la variable","NA", "Pourcentage"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 3.0 Résumé et comparaison des variables numériques ----
#' EDA Numerical Variables Summary
#'
#' @description
#' Perform some [inspectdf](https://github.com/alastairrushworth/inspectdf) package function and put the results in preformated tables.
#'
#' @param df A data frame.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_inspect_num()
#'
#' @export
my_inspect_num<- function(df){
  inspectdf::inspect_num(df) %>%
    dplyr::select(-hist) %>%
    knitr::kable(caption = "Resume et comparaison des variables numeriques",
                 col.names=c("Nom de la variable","min", "q1","median", "moyenne", "q3", "max", "sd", "NA (%)"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 4.0 Coeficient de corrélation pour toutes les variables numériques ----
#' EDA Correlation Coefficient for al Numerical Variables
#'
#' @description
#' Perform some [inspectdf](https://github.com/alastairrushworth/inspectdf) package function and put the results in preformated tables.
#'
#' @param df A data frame.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_inspect_cor()
#'
#' @export
my_inspect_cor<- function(df){
  inspectdf::inspect_cor(df) %>%
    dplyr::select(-lower, -upper) %>%
    knitr::kable(caption = "Coeficient de correlation pour toutes les variables numeriques",
                 col.names=c("Variable 1","Variable 2", "Correlation","Valeur P", "N-NA (%)"),
                 digits = c(4,1,2)) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}
## 5.0 Résumé et comparaison des variables catégotiques ----
#' EDA Categorical Variables Summary
#'
#' @description
#' Perform some [inspectdf](https://github.com/alastairrushworth/inspectdf) package function and put the results in preformated tables.
#'
#' @param df A data frame.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_inspect_cat()
#'
#' @export
my_inspect_cat<- function(df){
  inspectdf::inspect_cat(df) %>%
    dplyr::select(-levels) %>%
    knitr::kable(caption = "Resume et comparaison des variables categoriques",
                 col.names=c("Nom de la variable","Nombre", "Commun","pourcentage"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("condensed"), full_width = F, position = "left")
}

## 6.0 Résumé des catégories les plus utilisées ----
#' EDA Categories Summary
#'
#' @description
#' Perform some [inspectdf](https://github.com/alastairrushworth/inspectdf) package function and put the results in preformated tables.
#'
#' @param df A data frame.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_inspect_imb()
#'
#' @export
my_inspect_imb<- function(df){
  inspectdf::inspect_imb(df) %>%
    knitr::kable(caption = "Resume des categories les plus utilisees",
                 col.names=c("Nom de la variable","Categorie", "Pourcentage","Nombre"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("striped","condensed"), full_width = F, position = "left")
}
