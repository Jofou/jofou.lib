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
    knitr::kable(caption = "Variables Types",
                 col.names=c("Type","Nb", "Percentage", "Name"),
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
    knitr::kable(caption = "Missing Values",
                 col.names=c("Name","NA", "Percentage"),
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
    knitr::kable(caption = "Numeric Variables Summary",
                 col.names=c("Name","Min", "Q1","Med", "Mean", "Q3", "Max", "SD", "NA (%)"),
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
    knitr::kable(caption = "Correlation Coefficient",
                 col.names=c("Variable 1","Variable 2", "Correlation","P Value", "N-NA (%)"),
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
    knitr::kable(caption = "Categorical Variables",
                 col.names=c("Name","Nb", "Most Frequent","Percentage"),
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
    knitr::kable(caption = "Most Used Categories",
                 col.names=c("Name","Category", "Percentage","Nb"),
                 digits = 0) %>%
    kableExtra::kable_styling(bootstrap_options = c("striped","condensed"), full_width = F, position = "left")
}

## 7.0 Distribution des variables numériques ----
#' EDA Numerical Variables Distribution
#'
#' @description
#' Show distribution of numeric variables with a supperposition of box_plot and an histogram.
#'
#' @param df A data frame.
#' @param na.rm will remove NAs before making plots.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_num_dist()
#'
#' @export
my_num_dist <- function(df, na.rm = TRUE){

  # create list of numeric column in data to loop over
  slices <-inspectdf::inspect_num(df)
  slices.list<-base::unique(slices$col_name)

  #arrange df
  graph_data<- df %>%
    dplyr::select_if(is.numeric) %>%
    tidyr::gather()

  # create for loop to produce ggplot2 graphs
  for(v in base::seq_along(slices.list)) {

    # create plt1 for each v in df
    plt1 <- ggplot2::ggplot(subset(graph_data, graph_data$key==slices.list[v]), ggplot2::aes(x="", y = value)) +
      ggplot2::geom_boxplot(fill = "#FFFFFF", color = "black") +
      ggplot2::coord_flip() +
      ggplot2::xlab("") +
      ggplot2::ylab("")+
      ggplot2::theme_minimal()+
      ggplot2::theme(axis.line = ggplot2::element_line(linetype="solid", size=.3, color="black"),
                     axis.ticks = ggplot2::element_line(linetype="solid", size=.5, color="black"),
                     panel.grid.major = ggplot2::element_blank(),
                     panel.grid.minor = ggplot2::element_blank())


    # create plt2 for each v in df
    plt2 <-ggplot2::ggplot(subset(graph_data, graph_data$key==slices.list[v])) +
      ggplot2::geom_histogram(ggplot2::aes(x = value, y = (..count..)/sum(..count..)),
                     position = "identity", binwidth = 1,
                     fill = "#FFFFFF", color = "black") +
      ggplot2::ylab("Relative Frequency")+
      ggplot2::xlab("")+
      ggplot2::labs(title=slices.list[v])+
      ggplot2::theme_minimal()+
      ggplot2::theme(axis.line = ggplot2::element_line(linetype="solid", size=.3, color="black"),
                     axis.ticks = ggplot2::element_line(linetype="solid", size=.5, color="black"),
                     panel.grid.major.y = ggplot2::element_line(linetype="solid", size=.1, color="black"),
                     panel.grid.major.x = ggplot2::element_blank(),
                     panel.grid.minor = ggplot2::element_blank())


    #Group plt1 and plt2
    design <- "B
               A"
    plot<-wrap_plots(B=plt2, A=plt1, design = design)

    # print plots to screen
    base::print(plot)
  }
}

#utilities
wrap_plots <- function(..., ncol = NULL, nrow = NULL, byrow = NULL,
                       widths = NULL, heights = NULL, guides = NULL,
                       tag_level = NULL, design = NULL) {
  if (is_valid_plot(..1)) {
    plots <- list(...)
  } else if (is.list(..1)) {
    plots <- ..1
  } else {
    stop('Can only wrap ggplot and/or grob objects or a list of them', call. = FALSE)
  }
  if (!all(vapply(plots, is_valid_plot, logical(1)))) stop('Only know how to add ggplots and/or grobs', call. = FALSE)
  if (!is.null(names(plots)) && !is.null(design) && is.character(design)) {
    area_names <- unique(trimws(strsplit(design, '')[[1]]))
    area_names <- sort(setdiff(area_names, c('', '#')))
    if (all(names(plots) %in% area_names)) {
      plot_list <- vector('list', length(area_names))
      names(plot_list) <- area_names
      plot_list[names(plots)] <- plots
      plot_list[vapply(plot_list, is.null, logical(1))] <- list(patchwork::plot_spacer())
      plots <- plot_list
    }
  }
  Reduce(`+`, plots, init = plot_filler()) + patchwork::plot_layout(
    ncol = ncol, nrow = nrow, byrow = byrow, widths = widths, heights = heights,
    guides = guides, tag_level = tag_level, design = design
  )
}

#' @importFrom ggplot2 is.ggplot
#' @importFrom grid is.grob
is_valid_plot <- function(x) ggplot2::is.ggplot(x) || is.grob(x)

#' @importFrom ggplot2 ggplot
plot_filler <- function() {
  p <- ggplot()
  class(p) <- c('plot_filler', class(p))
  p
}

## 8.0 Graphique corrélation variables numériques ----
#' EDA Correlation Chart for all Numerics Variables
#'
#' @description
#' Show [PerformanceAnalytics](https://github.com/braverock/PerformanceAnalytics) correlation chart for all the numeric varibles in the data.
#'
#' @param df A data frame.
#' @param na.rm will remove NAs before making plots.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_corr_num_graph()
#'
#' @export
my_corr_num_graph <- function(df, na.rm = TRUE){
  graph_data<- df %>%
    dplyr::select_if(is.numeric)
  #faire le graphique
  plot<-PerformanceAnalytics::chart.Correlation(graph_data, method = "pearson", histogram=TRUE, pch=19)
  print(plot)
}


## 9.0 Distribution des variables catégoriques ----
#' EDA Categorical Variables Distribution
#'
#' @description
#' Show distribution of all categorical variable in data.
#'
#' @param df A data frame.
#' @param na.rm will remove NAs before making plots.
#'
#' @details
#' - Data must have the type of variables your looking to summarize.
#'
#' @examples
#' library(tidyverse)
#'
#' iris %>%
#'     my_cat_dist()
#'
#' @export
# create graphing function
my_cat_dist <- function(df, na.rm = TRUE){

  # create list of numeric column in data to loop over
  slices <-inspectdf::inspect_cat(df)
  slices.list<-base::unique(slices$col_name)

  #arrange df
  graph_data<- df %>%
    dplyr::select_if(purrr::negate(is.numeric)) %>%
    tidyr::gather()

  # create for loop to produce ggplot2 graphs
  for(v in seq_along(slices.list)) {

    # create plt1 for each v in df
    plt1 <- ggplot2::ggplot(subset(graph_data, graph_data$key==slices.list[v])) +
      ggplot2::geom_bar(ggplot2::aes(x = value, y = (..count..)/sum(..count..)),
               fill = "#FFFFFF", color = "black") +
      ggplot2::coord_flip() +
      ggplot2::xlab("") +
      ggplot2::ylab("Frequence relative")+
      ggplot2::labs(title=slices.list[v])+
      ggplot2::theme_minimal()+
      ggplot2::theme(axis.line = ggplot2::element_line(linetype="solid", size=.3, color="black"),
                     axis.ticks.y=ggplot2::element_blank(),
                     axis.ticks.x = ggplot2::element_line(linetype="solid", size=.5, color="black"),
                     panel.grid.major = ggplot2::element_blank(),
                     panel.grid.minor = ggplot2::element_blank())

    # print plots to screen
    print(plt1)
  }
}
