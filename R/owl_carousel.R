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

  # css and js
  header <- tags$head(
    tags$link(
      href = "owlcarousel-assets/owl_carousel/owl.carousel.min.css",
      rel="stylesheet",
      type="text/css"
    ),
    tags$link(
      href = "owlcarousel-assets/owl_carousel/style.css",
      rel="stylesheet",
      type="text/css"
    ),
    tags$script(
      src = "owlcarousel-assets/jquery/jquery.min.js"
    ),
    tags$script(
      src = "owlcarousel-assets/owl_carousel/owl.carousel.min.js"
    )
  )

  # cards
  cards <- htmltools::tags$div(
    id = id,
    class = "slider owl-carousel",
    ...
  )

  # keep TRUE and FALSE when call the functions to avoid confusion
  options2 <- lapply(options, function(x) {
    if (is.logical(x)) {
      y <- as.numeric(x)
      z <- ifelse(y == 0, "false", "true")
      return(z)
    } else {
      x
    }
  })

  js_owl_carousel <- htmltools::tags$script(
    paste0(
      '$(".slider").owlCarousel(', jsonlite::toJSON(options2), ')'
    )
  )

  return(
    shiny::tagAppendChildren(
      header,
      cards,
      js_owl_carousel
    )
  )
}
