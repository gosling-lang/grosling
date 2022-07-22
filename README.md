
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

track$view() %>% goslingwidget()
```

<!DOCTYPE html>
<html>
<head>
  <style>.error { color: red; }</style>
  <link rel="stylesheet" href="https://unpkg.com/higlass@1.11/dist/hglib.css">
</head>
<body>
  <div id="jupyter-gosling-caa9fb5f2ee8437dbf314c0ee14e9b20"></div>
  <script type="module">

    async function loadScript(src) {
        return new Promise(resolve => {
            const script = document.createElement('script');
            script.onload = resolve;
            script.src = src;
            script.async = false;
            document.head.appendChild(script);
        });
    }

    async function loadGosling() {
        // Manually load scripts from window namespace since requirejs might not be
        // available in all browser environments.

        // https://github.com/DanielHreben/requirejs-toggle
        if (!window.gosling) {

            // https://github.com/DanielHreben/requirejs-toggle
            window.__requirejsToggleBackup = {
                define: window.define,
                require: window.require,
                requirejs: window.requirejs,
            };

            for (const field of Object.keys(window.__requirejsToggleBackup)) {
                window[field] = undefined;
            }

            // load dependencies sequentially
            const sources = [
                "https://unpkg.com/react@17/umd/react.production.min.js",
                "https://unpkg.com/react-dom@17/umd/react-dom.production.min.js",
                "https://unpkg.com/pixi.js@6/dist/browser/pixi.min.js",
                "https://unpkg.com/higlass@1.11/dist/hglib.js",
                "https://unpkg.com/gosling.js@0.9.21/dist/gosling.js",
            ];

            for (const src of sources) await loadScript(src);

            // restore requirejs after scripts have loaded
            Object.assign(window, window.__requirejsToggleBackup);
            delete window.__requirejsToggleBackup;

        }

        return window.gosling;
    };

    var el = document.getElementById('jupyter-gosling-caa9fb5f2ee8437dbf314c0ee14e9b20');
    var spec = {"tracks": [{"data": {"type": "bigwig", "url": "https://s3.amazonaws.com/gosling-lang.org/data/ExcitatoryNeurons-insertions_bin100_RIPnorm.bw", "column": "position", "value": "peak"}, "height": 100.0, "mark": "point", "width": 800, "x": {"field": "position", "type": "genomic"}, "y": {"field": "peak", "type": "quantitative"}}]};
    var opt = {"padding": 0, "theme": null};

    loadGosling()
        .then(gosling => gosling.embed(el, spec, opt))
        .catch(err => {
            el.innerHTML = `<div class="error">
    <p>JavaScript Error: ${error.message}</p>
    <p>This usually means there's a typo in your Gosling specification. See the javascript console for the full traceback.</p>
</div>`;
            throw error;
        });
  </script>
</body>
</html>

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
