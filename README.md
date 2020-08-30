# pagemapR

<img src="./inst/img/pagemap.png" width="200" align="right" style="max-width: 50%;margin-left:20px;">

This is an R package that provides support for [pagemap](https://larsjung.de/pagemap/) as a [htmlwidget](http://htmlwidgets.org/).

Quickly and easily add a mini map to your long rmarkdown html report.

> Note: To distinguish it from the [original project `pagemap`](https://larsjung.de/pagemap/), the name of this project is `pagemapR`, but the package name is `pagemap`.

## Installation

`pagemapR` is not on CRAN now (may be later), you can use `devtools` to install the latest development version.

```r
library(devtools)
install_github('swsoyee/pagemapR')
```

## Usage

It's very simple to use.

```r
pagemap::pagemap(id = "mini_map")
```

You could fix it's position on the screen and style by providing a `list` of css property.

```r
pagemap::pagemap(id = "mini_map",
                 box_style = list(left = "5px", top = "10px"))
```

You could also customize the internal style of the mini map through the API provided by [`pagemap`](https://larsjung.de/pagemap/).

```r
pagemap::pagemap(
  id = "mini_map",
  styles = list(
    'h1,h2,a,code' = 'rgba(0,0,0,0.10)',
    'pre' = 'rgba(0,0,0,0.06)'
  )
)
```
