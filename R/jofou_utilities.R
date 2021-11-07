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

## 4.0 rle ----

#' Compter le nombre de répétition consécutives
#'
#' @param x column name
#'
#' @description
#' Use to count the number of repetition of same string in a dataframe column
#'
#' @export
rle_fx <- function(x) {
  plain_rle <- rle(x$y)
  my_df <- data.frame(run_length = plain_rle[[1]],
                      y = plain_rle[[2]])
  my_df
}

## 5.0 Job to render rmd ----

#' Créer une tacher pour rouler les rmd en job
#'
#' @description
#'Use to run rmd on a job
#'
#' @export
render_with_job <- function() {
  rstudioapi::verifyAvailable()

  job_file <- tempfile(fileext = ".R")

  active_doc_ctx <- rstudioapi::getSourceEditorContext()
  rmd_path <- active_doc_ctx$path

  if (identical(rmd_path, "")) {
    rstudioapi::showDialog(
      "Cannot Render Unsaved R Markdown Document",
      "Please save the current document before rendering."
    )
    return(invisible())
  }

  rstudioapi::documentSave(active_doc_ctx$id)

  rmd_path <- normalizePath(rmd_path, mustWork = TRUE)

  cat(
    'res <- rmarkdown::render("', basename(rmd_path), '")\n',
    'unlink("', job_file, '")\n',
    'rstudioapi::viewer(res)',
    sep = "",
    file = job_file
  )

  rstudioapi::jobRunScript(
    path = job_file,
    name = basename(rmd_path),
    workingDir = dirname(rmd_path),
    importEnv = FALSE
  )
}
