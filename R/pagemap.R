#' Mini Map of Page
#'
#' Create mini map for single web page.
#'
#' @param id \code{string} id for canvas mini map.
#' @param box_style a \code{list} of css propery of mini map box.
#' @param ... additional options passed to \code{pagemap}.
#' @param elementId \code{string} id as a valid \code{CSS} element id for htmlwidgets.
#'
#' @import htmlwidgets
#' @examples
#' library(pagemap)
#' pagemap(id = "mini_map")
#' @export
pagemap <- function(id,
                    box_style = list(),
                    ...,
                    elementId = NULL) {
  # Settings of canvas box positions
  default_box_style <- list(
    position = 'fixed',
    top = '5px',
    right = '5px',
    width = '200px',
    height = '100%',
    `z-index` = '100'
  )
  box_style <-
    append(box_style, default_box_style[!names(default_box_style) %in% names(box_style)])
  box_style_string <-
    paste0(names(box_style), ":", box_style, ";", collapse = "")

  params <- list(id = id,
                 style = box_style_string,
                 options = list(...))

  params <- Filter(Negate(is.null), params)

  # create widget
  htmlwidgets::createWidget(
    name = 'pagemap',
    params,
    width = 0,
    height = 0,
    package = 'pagemap',
    elementId = elementId
  )
}

#' Shiny bindings for pagemap
#'
#' Output and render functions for using pagemap within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param expr An expression that generates a pagemap
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name pagemap-shiny
#'
#' @export
pagemapOutput <- function(outputId) {
  htmlwidgets::shinyWidgetOutput(outputId, 'pagemap', package = 'pagemap')
}

#' @rdname pagemap-shiny
#' @export
renderPagemap <-
  function(expr,
           env = parent.frame(),
           quoted = FALSE) {
    if (!quoted) {
      expr <- substitute(expr)
    } # force quoted
    htmlwidgets::shinyRenderWidget(expr, pagemapOutput, env, quoted = TRUE)
  }
