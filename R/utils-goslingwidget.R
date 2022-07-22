#' Gos spec
#'
#' @export goslingwidget
#'
goslingwidget <- function(spec) {
  html <- as.character(spec$`_repr_mimebundle_`()['text/html'])
  htmltools::HTML(html)
}

#' @export
#'
print.gosling.api.View <- function(x, ...) {

  x <- goslingwidget(x)

  print(x, ...)
}

#' @export
#'
format.gosling.api.View <- function(x, ...) {

  x <- goslingwidget(x)

  format(x, ...)
}

#' @importFrom knitr knit_print
#' @export
#'
knit_print.gosling.api.View <- function(spec, ..., options = NULL) {

  spec <- goslingwidget(spec)

  knitr::knit_print(spec, ..., options = options)
}
