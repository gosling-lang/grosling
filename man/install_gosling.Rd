% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/install.R
\name{install_gosling}
\alias{install_gosling}
\title{Install Gos Python package}
\usage{
install_gosling(
  method = c("conda", "virtualenv"),
  envname = "r-reticulate",
  version = NULL,
  ...
)
}
\arguments{
\item{method}{\code{character}, indicates to use \code{"conda"} or \code{"virtualenv"}}

\item{envname}{\code{character}, name of environment into which to install}

\item{version}{\code{character}, version of Gos to install. For general use of this package,
this is set automatically, so you should not need to specify this.}

\item{...}{other arguments sent to \code{reticulate::py_install()}}
}
\value{
invisible \code{NULL}, called for side-effects
}
\description{
This function wraps installation functions from \link[reticulate:reticulate]{reticulate}
to install the Python package \strong{gos}.
}
\details{
This package uses the \link[reticulate:reticulate]{reticulate} package
to make an interface with the \href{https://github.com/gosling-lang/gos}{Gos}
Python package. To promote consistency in usage of \strong{reticulate} among
different R packages, it is
\href{https://rstudio.github.io/reticulate/articles/package.html#installing-python-dependencies}{recommended}
to use a common Python environment, called \code{"r-reticulate"}.

Depending on your setup, you can create this environment using
\code{reticulate::conda_create()} or \code{\link[reticulate:virtualenv-tools]{reticulate::virtualenv_create()}},
as described in this
\href{https://rstudio.github.io/reticulate/articles/python_packages.html#conda-installation}{reticulate article}.
}
