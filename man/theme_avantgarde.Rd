% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jofou_theme.R
\name{theme_avantgarde}
\alias{theme_avantgarde}
\title{Minimal ggplot2 theme using the AvantGarde font}
\usage{
theme_avantgarde(
  base_size = 11,
  strip_text_size = 12,
  strip_text_margin = 5,
  subtitle_size = 13,
  subtitle_margin = 10,
  plot_title_size = 16,
  plot_title_margin = 10,
  plot_axis = 1,
  plot_ticks = 0.5,
  ...
)
}
\arguments{
\item{base_size}{base font size}

\item{strip_text_size, strip_text_margin}{plot strip text size and margin}

\item{subtitle_size, subtitle_margin}{plot subtitle size and margin}

\item{plot_title_size, plot_title_margin}{plot title size and margin}

\item{plot_axis, plot_ticks}{plot axis and ticks size}

\item{...}{Other arguments passed to \code{theme_minimal}}
}
\description{
Minimal ggplot2 theme using the AvantGarde font
}
\details{
The AvantGarde font is a base font of the \href{https://github.com/wch/extrafont}{extrafont} package
}
\examples{
\dontrun{
library(ggplot2)

ggplot(mtcars, aes(wt, mpg)) +
    geom_point() +
    labs(title = "A Lovely Plot",
         subtitle = "What can the subtitle tell us?") +
    theme_avantgarde()

ggplot(diamonds, aes(carat, price, color = clarity)) +
    geom_point(alpha = 0.7) +
    facet_wrap(~cut) +
    labs(title = "A Lovely Plot",
         subtitle = "What can the subtitle tell us?") +
         theme_avantgarde()

}

}
