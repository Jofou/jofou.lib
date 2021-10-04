# Utilities functions ----

## 1.0 Calculer le mode ----

#' Calculate Mode
#'
#' @description
#' Calculate mode of a caracter variable present in a data set.
#'
#' @param x A variable.
#'
#' @details
#' - Data must have a categorical variable you want to know the most frequent value.
#'
#' @examples
#' library(tidyverse)
#'
#'  iris %>%
#'  mutate(cat_Sepal.Length=round(Sepal.Length, digits = 0)) %>%
#'  group_by(cat_Sepal.Length) %>%
#'  summarise(mode_species=calculate_mode(Species))
#'
#' @export
calculate_mode <- function(x) {
  uniqx <- base::unique(x)
  uniqx[base::which.max(base::tabulate(base::match(x, uniqx)))]
}

## 2.0 Negate in ----

#' Not Include In
#'
#' @description
#' Use to filter that are not in.
#'
#' @param x A variable.
#' @param table A data frame.
#' @details
#' - Data must have a categorical variable you want to know the most frequent value.
#'
#' @examples
#' library(tidyverse)
#'
#'  iris %>%
#'  filter(Species %ni% "setosa") %>%
#'  group_by(Species) %>%
#'  summarise(nb=dplyr::n())
#'
#' @export
#"#%ni%"<-Negate('%in%')
"%ni%" <- function(x, table) match(x, table, nomatch = 0) == 0

## 3.0 Date in title ----

#' Custom Knit function for RStudio
#'
#' @param input the input file path
#' @param ... other arguments passed to rmarkdown::render()
#'
#' @description
#' Use to add date in the title of the knit markdown document
#'
#' @examples
#' #---
#' #knit: jofou.lib::knit_with_date_html
#' #---
#'
#' @export
knit_with_date_html <- function(input, ...) {
  rmarkdown::render(
    input,
    output_file = paste0(
      xfun::sans_ext(input), '-', Sys.Date(), '.',"html"
    ),
    envir = globalenv()
  )
}
