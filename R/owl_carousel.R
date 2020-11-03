#' Create an owlCarousel
#'
#' `owl_carousel` is the function that embeds the cards created by `owl_carousel_item()`. This is where you specify the behavior of the carousel through several options.
#'
#' @param id The id of the carousel, a character vector
#' @param ... Items created by `owl_carousel_item()`
#' @param options List of options to customize the behavior of the carousel. See below for the details.
#'
#' @details
#'
#' Available options:
#'* TRUE/FALSE options:
#'    * `loop`: carousel slides infinitely
#'    * `autoplay`: carousel slides automatically
#'    * `center`: the first item is at the center
#'    * `rewind`: go backwards when the boundary has reached
#'    * `autoplayHoverPause`: stop automatic sliding when hovering a card
#'    *
#'
#'
#'* numeric options:
#'    * `autoplayTimeout`: time (in milliseconds) before sliding (when autoplay is true)
#'
#' @import htmlwidgets
#'
#' @export
owl_carousel <- function(id, ..., options = list()) {

  tag <- htmltools::tags$div(
    id = id,
    class = "slider owl-carousel",
    ...
  )

  # keep TRUE and FALSE when call the functions to avoid confusion
  # need to transform these for JS
  options <- lapply(options, function(x) {
    if (is.logical(x)) {
      y <- as.numeric(x)
      z <- ifelse(y == 0, "false", "true")
      return(z)
    } else {
      x
    }
  })

  x <- list(
    ui = as.character(
      htmltools::tagList(
        tag,
        html_dependency_owlcarousel()
      )
    ),
    opts = options
  )

  htmlwidgets::createWidget(
    name = 'owl_carousel',
    x,
    package = 'shinymisc'
  )
}


# owl_carousel <- function(message, width = NULL, height = NULL, elementId = NULL) {
#
#   x = list(
#     message = message
#   )
#
#   htmlwidgets::createWidget(
#     name = 'owl_carousel',
#     x,
#     width = width,
#     height = height,
#     package = 'shinymisc',
#     elementId = elementId
#   )
# }











#' Shiny bindings for owl_carousel
#'
#' Output and render functions for using owl_carousel within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a owl_carousel
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name owl_carousel-shiny
#'
#' @export
owl_carouselOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'owl_carousel', width, height, package = 'shinymisc')
}

#' @rdname owl_carousel-shiny
#' @export
renderOwl_carousel <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, owl_carouselOutput, env, quoted = TRUE)
}
