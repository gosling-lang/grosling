#' Install Gos Python package
#'
#' This function wraps installation functions from [reticulate][reticulate::reticulate]
#' to install the Python package **gos**.
#'
#' This package uses the [reticulate][reticulate::reticulate] package
#' to make an interface with the [Gos](https://github.com/gosling-lang/gos)
#' Python package. To promote consistency in usage of **reticulate** among
#' different R packages, it is
#' [recommended](https://rstudio.github.io/reticulate/articles/package.html#installing-python-dependencies)
#' to use a common Python environment, called `"r-reticulate"`.
#'
#' Depending on your setup, you can create this environment using
#' `reticulate::conda_create()` or [reticulate::virtualenv_create()],
#' as described in this
#' [reticulate article](https://rstudio.github.io/reticulate/articles/python_packages.html#conda-installation).
#'
#' @param method `character`, indicates to use `"conda"` or `"virtualenv"`
#' @param envname `character`, name of environment into which to install
#' @param version `character`, version of Gos to install. For general use of this package,
#'   this is set automatically, so you should not need to specify this.
#' @param ... other arguments sent to `reticulate::py_install()`
#'
#' @return invisible `NULL`, called for side-effects
#'
#' @export
#'
install_gosling <- function(
    method = c("conda", "virtualenv"),
    envname = "r-reticulate",
    version = NULL,
    ...
) {

  # validate stage, method arguments
  method <- match.arg(method)

  gosling_pkg <- "gosling" # just gosling, no server

  if (!is.null(version)) {
    gosling_pkg <- paste(gosling_pkg, version, sep = "==")
  }

  # Cython needed when we add server
  # packages <- c("Cython", gosling_pkg)
  packages <- c(gosling_pkg)

  reticulate::py_install(
    packages = packages,
    envname = envname,
    method = method,
    pip = TRUE,
    pip_ignore_installed = TRUE,
    ...
  )

  invisible(NULL)
}


#' Check the Gos installation
#' TODO
#'
#' @export
#'
check_gosling <- function(quiet = FALSE) {}

#' Installed versions of Gos
#'
#' Returns a named list of version tags for Gos
#'
#' @return named `list` of version tags
#' @examples
#' if (interactive()) {
#'   gosling_version()
#' }
#'
#' @export
#'
gosling_version <- function() {
  c(
    list(gosling = gos$`__version__`)
  )
}
