# ML functions ----

## 1.0 Calibrate and Plot ----

#' ML Calibrate and Plot
#'
#' @description
#' Perform [modeltime](https://cran.r-project.org/web/packages/modeltime/vignettes/getting-started-with-modeltime.html) calibrate and plot function at the same time.
#'
#' @param ... A fitted model object that is either:
#' 1. A modeltime table that has been created using [modeltime_table()]
#' 2. A workflow that has been fit by [fit.workflow()](https://workflows.tidymodels.org/reference/fit-workflow.html) or
#' 3. A parsnip model that has been fit using [fit.model_spec()](https://parsnip.tidymodels.org/reference/fit.html)
#' @param type A test data set `tibble` containing future information (timestamps and actual values).
#'
#' @details
#' -The results of calibration and plot are used to evaluate models

#' @examples
#' library(tidyverse)
#' library(lubridate)
#' library(timetk)
#' library(parsnip)
#' library(rsample)
#' library(modeltime)
#'
#' # Data
#' data_prepared_tbl <- m4_monthly %>% filter(id == "M750")
#'
#' # Split Data 80/20
#' splits <- initial_time_split(data_prepared_tbl, prop = 0.9)
#'
#' # Model: auto_arima
#' model_fit_arima <- arima_reg() %>%
#'     set_engine(engine = "auto_arima") %>%
#'     fit(value ~ date, data = training(splits))
#'
#' # Calibrate and plot
#' calibrate_and_plot(model_fit_arima, type="testing")

#' @export
calibrate_and_plot <-
  function(..., type = "testing") {

    if (type == "testing") {
      new_data <- rsample::testing(splits)
    } else {
      new_data <- rsample::training(splits) %>% tidyr::drop_na()
    }

    calibration_tbl <- modeltime::modeltime_table(...) %>%
      modeltime::modeltime_calibrate(new_data)

    print(calibration_tbl %>% modeltime::modeltime_accuracy())

    calibration_tbl %>%
      modeltime::modeltime_forecast(
        new_data = new_data,
        actual_data = data_prepared_tbl
      ) %>%
      modeltime::plot_modeltime_forecast(.conf_interval_show = FALSE)

  }
