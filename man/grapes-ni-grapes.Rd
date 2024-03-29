% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jofou_utilities.R
\name{\%ni\%}
\alias{\%ni\%}
\title{Not Include In}
\usage{
x \%ni\% table
}
\arguments{
\item{x}{A variable.}

\item{table}{A data frame.}
}
\description{
Use to filter that are not in.
}
\details{
\itemize{
\item Data must have a categorical variable you want to know the most frequent value.
}
}
\examples{
library(tidyverse)

 iris \%>\%
 filter(Species \%ni\% "setosa") \%>\%
 group_by(Species) \%>\%
 summarise(nb=dplyr::n())

}
