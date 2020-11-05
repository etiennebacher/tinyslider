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
#' @export owl_carousel
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
