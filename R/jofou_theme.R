#' Minimal ggplot2 theme using the Calibri font
#'
#' @param base_size base font size
#' @param strip_text_size,strip_text_margin plot strip text size and margin
#' @param subtitle_size,subtitle_margin plot subtitle size and margin
#' @param plot_title_size,plot_title_margin plot title size and margin
#' @param plot_axis,plot_ticks plot axis and ticks size
#' @param ... Other arguments passed to \code{theme_minimal}
#'
#' @details The Calibri font is a base font of the [extrafont](https://github.com/wch/extrafont) package
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(wt, mpg)) +
#'     geom_point() +
#'     labs(title = "A Lovely Plot",
#'          subtitle = "What can the subtitle tell us?") +
#'     theme_calibri()
#'
#' ggplot(diamonds, aes(carat, price, color = clarity)) +
#'     geom_point(alpha = 0.7) +
#'     facet_wrap(~cut) +
#'     labs(title = "A Lovely Plot",
#'          subtitle = "What can the subtitle tell us?") +
#'          theme_calibri()
#'
#'}
#'
#' @export
theme_calibri <- function(base_size = 11,
                          strip_text_size = 12,
                          strip_text_margin = 5,
                          subtitle_size = 13,
                          subtitle_margin = 10,
                          plot_title_size = 16,
                          plot_title_margin = 10,
                          plot_axis= 1,
                          plot_ticks= 0.5,
                          ...) {
  ret <- ggplot2::theme_minimal(base_family = "Calibri",
                                base_size = base_size, ...)
  ret$strip.text <- ggplot2::element_text(
    hjust = 0, size = strip_text_size,
    margin = ggplot2::margin(b = strip_text_margin),
    family = "Calibri"
  )
  ret$plot.subtitle <- ggplot2::element_text(
    hjust = 0, size = subtitle_size,
    margin = ggplot2::margin(b = subtitle_margin),
    family = "Calibri"
  )
  ret$plot.title <- ggplot2::element_text(
    hjust = 0, size = plot_title_size,
    margin = ggplot2::margin(b = plot_title_margin),
    family = "Calibri",
    face ="bold"
  )
  ret$axis.line <- ggplot2::element_line(
    size = plot_axis,
  )
  ret$axis.ticks <- ggplot2::element_line(
    size = plot_ticks,
  )
  ret$panel.grid <- ggplot2::element_blank()
  ret
}
#' Minimal ggplot2 theme using the Serif font
#'
#' @param base_size base font size
#' @param strip_text_size,strip_text_margin plot strip text size and margin
#' @param subtitle_size,subtitle_margin plot subtitle size and margin
#' @param plot_title_size,plot_title_margin plot title size and margin
#' @param plot_axis,plot_ticks plot axis and ticks size
#' @param ... Other arguments passed to \code{theme_minimal}
#'
#' @details The Serif font is a base font of the [extrafont](https://github.com/wch/extrafont) package
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(wt, mpg)) +
#'     geom_point() +
#'     labs(title = "A Lovely Plot",
#'          subtitle = "What can the subtitle tell us?") +
#'     theme_serif()
#'
#' ggplot(diamonds, aes(carat, price, color = clarity)) +
#'     geom_point(alpha = 0.7) +
#'     facet_wrap(~cut) +
#'     labs(title = "A Lovely Plot",
#'          subtitle = "What can the subtitle tell us?") +
#'          theme_serif()
#'
#'}
#'
#' @export
theme_serif <- function(base_size = 11,
                          strip_text_size = 12,
                          strip_text_margin = 5,
                          subtitle_size = 13,
                          subtitle_margin = 10,
                          plot_title_size = 16,
                          plot_title_margin = 10,
                          plot_axis= 1,
                          plot_ticks= 0.5,
                          ...) {
  ret <- ggplot2::theme_minimal(base_family = "serif",
                                base_size = base_size, ...)
  ret$strip.text <- ggplot2::element_text(
    hjust = 0, size = strip_text_size,
    margin = ggplot2::margin(b = strip_text_margin),
    family = "serif"
  )
  ret$plot.subtitle <- ggplot2::element_text(
    hjust = 0, size = subtitle_size,
    margin = ggplot2::margin(b = subtitle_margin),
    family = "serif"
  )
  ret$plot.title <- ggplot2::element_text(
    hjust = 0, size = plot_title_size,
    margin = ggplot2::margin(b = plot_title_margin),
    family = "serif",
    face ="bold"
  )
  ret$axis.line <- ggplot2::element_line(
    size = plot_axis,
  )
  ret$axis.ticks <- ggplot2::element_line(
    size = plot_ticks,
  )
  ret$panel.grid <- ggplot2::element_blank()
  ret
}

#' Minimal ggplot2 theme using the AvantGarde font
#'
#' @param base_size base font size
#' @param strip_text_size,strip_text_margin plot strip text size and margin
#' @param subtitle_size,subtitle_margin plot subtitle size and margin
#' @param plot_title_size,plot_title_margin plot title size and margin
#' @param plot_axis,plot_ticks plot axis and ticks size
#' @param ... Other arguments passed to \code{theme_minimal}
#'
#' @details The AvantGarde font is a base font of the [extrafont](https://github.com/wch/extrafont) package
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(wt, mpg)) +
#'     geom_point() +
#'     labs(title = "A Lovely Plot",
#'          subtitle = "What can the subtitle tell us?") +
#'     theme_avantgarde()
#'
#' ggplot(diamonds, aes(carat, price, color = clarity)) +
#'     geom_point(alpha = 0.7) +
#'     facet_wrap(~cut) +
#'     labs(title = "A Lovely Plot",
#'          subtitle = "What can the subtitle tell us?") +
#'          theme_avantgarde()
#'
#'}
#'
#' @export
theme_avantgarde <- function(base_size = 11,
                        strip_text_size = 12,
                        strip_text_margin = 5,
                        subtitle_size = 13,
                        subtitle_margin = 10,
                        plot_title_size = 16,
                        plot_title_margin = 10,
                        plot_axis= 1,
                        plot_ticks= 0.5,
                        ...) {
  ret <- ggplot2::theme_minimal(base_family = "AvantGarde",
                                base_size = base_size, ...)
  ret$strip.text <- ggplot2::element_text(
    hjust = 0, size = strip_text_size,
    margin = ggplot2::margin(b = strip_text_margin),
    family = "AvantGarde"
  )
  ret$plot.subtitle <- ggplot2::element_text(
    hjust = 0, size = subtitle_size,
    margin = ggplot2::margin(b = subtitle_margin),
    family = "AvantGarde"
  )
  ret$plot.title <- ggplot2::element_text(
    hjust = 0, size = plot_title_size,
    margin = ggplot2::margin(b = plot_title_margin),
    family = "AvantGarde",
    face ="bold"
  )
  ret$axis.line <- ggplot2::element_line(
    size = plot_axis,
  )
  ret$axis.ticks <- ggplot2::element_line(
    size = plot_ticks,
  )
  ret$panel.grid <- ggplot2::element_blank()
  ret
}
