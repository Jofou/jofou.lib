% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jofou_EDA.R
\name{my_inspect_types}
\alias{my_inspect_types}
\title{EDA Inspect Data Types}
\usage{
my_inspect_types(df)
}
\arguments{
\item{df}{A data frame.}
}
\description{
Perform some \href{https://github.com/alastairrushworth/inspectdf}{inspectdf} package function and put the results in preformated tables.
}
\details{
\itemize{
\item Data must have the type of variables your looking to summarize.
}
}
\examples{
library(tidyverse)

iris \%>\%
    my_inspect_types()

}
