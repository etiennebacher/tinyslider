#' Create a carousel with tinyslider
#'
#' @param id Id of the carousel
#' @param ... Items created with `tinyslider_card`
#' @param options List of options for the carousel
#'
#' @importFrom htmlwidgets createWidget
#' @importFrom shiny tags
#'
#' @export
tinyslider <- function(id, ..., options = list(), width = NULL, height = NULL) {


    mytag <- tags$div(
      class = "tinyslider-container",
      tags$div(
        id = id,
        class = "my-slider",
        list(...)
      )
    )

    options[["container"]] <- ".my-slider"

    x <- list(
      ui = as.character(mytag),
      opts = options
    )

    createWidget(
      name = 'tinyslider',
      x,
      width = width,
      height = height,
      package = 'tinyslider'
    )
}


#' Shiny bindings for tinyslider
#'
#' Output and render functions for using tinyslider within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a tinyslider
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name tinyslider-shiny
#'
#' @export
tinysliderOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'tinyslider', width, height, package = 'tinyslider')
}

#' @rdname tinyslider-shiny
#' @export
renderTinyslider <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tinysliderOutput, env, quoted = TRUE)
}
