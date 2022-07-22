
<!-- README.md is generated from README.Rmd. Please edit that file -->

**Here be dragons** 🐉

# g(r)osling

<!-- badges: start -->
<!-- badges: end -->

The goal of **g(r)osling** is to help you build interactive genomics
visualizations with
[Gosling](https://github.com/gosling-lang/gosling.js). This package uses
[reticulate](https://rstudio.github.io/reticulate/) to provide an
interface to the [Gos](https://github.com/gosling-lang/gos) Python
package.

## Example

``` r
library("gosling")

data <- gos$bigwig(
  url = "https://s3.amazonaws.com/gosling-lang.org/data/ExcitatoryNeurons-insertions_bin100_RIPnorm.bw",
  column = "position",
  value = "peak"
)

track <- gos$Track(data, height = 100)$mark_point()$encode(
  x = gos$X("position:G"),
  y = gos$Y("peak:Q")
)

view <- track$view()

view
```

![Gosling
visualization](https://user-images.githubusercontent.com/24403730/180341226-a9ac36b4-47cb-40d8-bfd2-a2e6f18c153f.png)

## Installation

You can install the development version of gosling like so:

``` r
devtools::install_github("gosling-lang/grosling") 
```

Because of Python, there may be some additional installation steps.

1.) Python must be installed on your system. We recommend `conda`.

2.) Create a conda environment called `"r-reticulate"`. It is
[recommended](https://rstudio.github.io/reticulate/articles/python_packages.html)
to use this environment name for all packages that use reticulate.

3.) Install Gos into your `"r-reticulate"` environment using
`gosling::install_gosling()`.

You may wish to add a line like this to the `.First()` function in your
`.Rprofile`:

``` r
reticulate::use_condaenv("r-reticulate")
```

The `use_condaenv()` function is called to provide a hint to reticulate
on which Python environment to use.
