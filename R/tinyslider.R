#' Create a carousel with tinyslider
#'
#' @param id Id of the carousel
#' @param ... Items created with `tinyslider_item`
#' @param options List of options for the carousel
#'
#' @import htmlwidgets
#'
#' @export
tinyslider <- function(id, ..., options = list()) {


  # # css and js
  # header <- tags$head(
  #   tags$link(
  #     href = 'tinyslider-assets/tinyslider.min.css',
  #     rel='stylesheet',
  #     type='text/css'
  #   ),
  #   tags$link(
  #     href = 'tinyslider-assets/custom.css',
  #     rel='stylesheet',
  #     type='text/css'
  #   ),
  #   tags$script(
  #     src = 'tinyslider-assets/tinyslider.js'
  #   )
  # )
  #
  # # cards
  # cards <- htmltools::tags$div(
  #     id = 'id',
  #     class = 'tinyslider-wrap',
  #     htmltools::tags$div(
  #       class = 'tinyslider',
  #       ...
  #     )
  #   )
  #
  # # keep TRUE and FALSE when call the functions to avoid confusion
  # if (length(options) != 0) {
  #   options2 <- lapply(options, function(x) {
  #     if (is.logical(x)) {
  #       y <- as.numeric(x)
  #       z <- ifelse(y == 0, 'false', 'true')
  #       return(z)
  #     } else {
  #       x
  #     }
  #   })
  # } else {
  #   options2 <- list()
  # }
  #
  # options2[['container']] <-  '.tinyslider'
  #
  # js_tinyslider <- htmltools::tags$script(
  #   paste0(
  #     'let slider = tns(', jsonlite::toJSON(options2), ')'
  #   ) %>%
  #     gsub('\\[', '', .) %>%
  #     gsub('\\]', '', .)
  # )
  #
  # return(
  #   shiny::tagAppendChildren(
  #     header,
  #     cards,
  #     js_tinyslider
  #   )
  # )


    mytag <- htmltools::tags$div(
        id = id,
        class = 'my-slider',
        list(...)
    )

    # keep TRUE and FALSE when call the functions to avoid confusion
    # need to transform these for JS
    options <- lapply(options, function(x) {
      if (is.logical(x)) {
        y <- as.numeric(x)
        z <- ifelse(y == 0, 'false', 'true')
        return(z)
      } else {
        x
      }
    })

    options[['container']] <-  '.my-slider'

    x <- list(
      ui = as.character(mytag),
      opts = options
    )

    htmlwidgets::createWidget(
      name = 'tinyslider',
      x,
      package = 'shinymisc'
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
  htmlwidgets::shinyWidgetOutput(outputId, 'tinyslider', width, height, package = 'shinymisc')
}

#' @rdname tinyslider-shiny
#' @export
renderTinyslider <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tinysliderOutput, env, quoted = TRUE)
}
