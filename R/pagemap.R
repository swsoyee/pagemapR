#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
pagemap <- function(id, elementId = NULL) {

  # forward options using x
  x = list(
    id = id
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'pagemap',
    x,
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
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a pagemap
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name pagemap-shiny
#'
#' @export
pagemapOutput <- function(outputId){
  htmlwidgets::shinyWidgetOutput(outputId, 'pagemap', package = 'pagemap')
}

#' @rdname pagemap-shiny
#' @export
renderPagemap <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, pagemapOutput, env, quoted = TRUE)
}
