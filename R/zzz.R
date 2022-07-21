# Adapted from:  https://raw.githubusercontent.com/vegawidget/gos/main/R/zzz.R
# reference: https://rstudio.github.io/reticulate/articles/package.html

#' Gos object
#'
#' Uses the reticulate framework to access the Gos API.
#'
#' The Gos Python package is exposed through the `gos` object.
#' You can create and add to chart using its methods and classes,
#' as outlined in the
#' [Gos Python documentation](https://gosling-lang.github.io/gos).
#'
#' In this package, use the `$` operator wherever you see the `.` operator
#' used in Python.
#'
#' @seealso [Gos Python documentation](https://gosling-lang.github.io/gos)
#' @export gos
#'
gos <- NULL

on_gos_load <- function() {
  # check_gos(quiet = TRUE)

  # leave this here in case we ever need to check the version of reticulate
  #
  # version_reticulate <- utils::packageVersion("reticulate")

}

on_gos_error <- function(e) {
  cat(
    "Error importing gos python package:",
    "",
    conditionMessage(e),
    "",
    "Output from reticulate::py_config():",
    sep = "\n"
  )
  print(reticulate::py_config())
  # cat(
  #   "",
  #   "Output from reticulate::py_list_packages():",
  #   sep = "\n"
  # )
  # print(reticulate::py_list_packages())

  NULL
}

#' Gos spec
#'
#' @export goslingwidget
#'
goslingwidget <- function(spec) {
  html <- as.character(spec$`_repr_mimebundle_`()['text/html'])
  htmltools::HTML(html)
}

# =============================================================================
# Note to maintainers:
#
# To change the supported Python version, set the option in .onLoad
# =============================================================================
.onLoad <- function(libname, pkgname) {
  gos <<- reticulate::import(
    module = "gosling",
    as = "gos",
    delay_load = list(on_load = on_gos_load, on_error = on_gos_error)
  )
}

