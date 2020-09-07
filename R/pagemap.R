#' Mini Map of Page
#'
#' Create mini map for single web page.
#'
#' @param id \code{string} id for canvas mini map. Default is 10 randomly generated
#' letters.
#' @param box_style a \code{list} of css propery of mini map box. If not provided,
#' default values are used.
#' @param ... additional options passed to \code{pagemap}.
#' @param elementId \code{string} id as a valid \code{CSS} element id for htmlwidgets.
#'
#' @import htmlwidgets
#' @name pagemap
#'
#' @seealso \href{https://larsjung.de/pagemap/}{Pagemap home page}.
#'
#' @examples
#' library(pagemap)
#' # Most basic usage
#' pagemap()
#'
#' # Fix it’s position on the screen
#' pagemap(id = "mini_map",
#'      box_style = list(left = "5px", top = "10px"))
#'
#' # Style by providing a list of css property
#' pagemap(
#'   id = "mini_map",
#'   styles = list(
#'     'h1,h2,a,code' = 'rgba(0, 0, 0, 0.10)',
#'     'img' = 'rgba(0, 0, 0, 0.08)',
#'     'pre' = 'rgba(0, 0, 0, 0.04)'
#'   )
#' )
#' @export
pagemap <- function(id,
                    box_style = list(),
                    ...,
                    elementId = NULL) {
  if (missing(id))
    id <- paste0(sample(letters, size = 10), collapse = "")

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

  # forward options using params
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
#' @param outputId output variable to read from.
#' @param width,height Fixed width for pagemap (in css units). Ignored when used in
#' a Shiny app. It is not recommended to use this parameter because the widget knows
#' how to adjust its width automatically.
#' @param expr An expression that generates a pagemap
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#' is useful if you want to save an expression in a variable.
#'
#' @seealso \code{\link{pagemap}}
#'
#' @name pagemap-shiny
#'
#' @export
#' @examples
#'library(shiny)
#'
#'## Only run this example in interactive R sessions
#'if (interactive()) {
#'  shinyApp(
#'    ui = fluidPage(pagemapOutput("pagemap")),
#'    server = function(input, output) {
#'      output$pagemap <- renderPagemap(pagemap())
#'    }
#'  )
#'}
pagemapOutput <-
  function(outputId,
           width = '100%',
           height = 'auto') {
    htmlwidgets::shinyWidgetOutput(outputId, 'pagemap', width, height, package = 'pagemap')
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
