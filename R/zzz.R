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

# =============================================================================
# Note to maintainers:
#
# To change the supported Python version, set the option in .onLoad
# =============================================================================
.onLoad <- function(libname, pkgname) {
  gos <<- reticulate::import("gosling", delay_load = TRUE)
}

