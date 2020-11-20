#' Create a carousel with tinyslider
#'
#' @param id Id of the carousel
#' @param ... Items created with `tinyslider_card`
#' @param options List of options for the carousel
#'
#' @details Due to its length, I do not detail the list of options available. This list is avaible [here](https://github.com/ganlanyuan/tiny-slider#options).
#'
#' WARNING: the option "container" is automatically set in the function and therefore should not be modified.
#'
#' @examples
#' \dontrun{
#' library(shiny)
#' library(tinyslider)
#'
#' ui <- fluidPage(
#'   tinysliderOutput("test")
#' )
#' server <- function(input, output, session) {
#'
#'   output$test <- renderTinyslider({
#'     tinyslider(
#'       id = "test",
#'       tinyslider_card(
#'         id = "id1",
#'         title = "A beautiful landscape",
#'         subtitle = "Where is this?",
#'         content = "Available events include: indexChanged, transitionStart, transitionEnd, newBreakpointStart, newBreakpointEnd, touchStart, touchMove, touchEnd, dragStart, dragMove and dragEnd.",
#'         image = "https://c.pxhere.com/photos/27/7b/scotland_centralscotland_benmore_stobbinnein_crianlarich_scotspine_mountains_landscape-267332.jpg!d"
#'       ),
#'       tinyslider_card(
#'         "id2",
#'         "A city now",
#'         "Same question",
#'         "There is a button below",
#'         button_text = "See more",
#'         image = "https://c.pxhere.com/photos/75/a5/granada_spain_city_urban_buildings_architecture_houses_homes-1122666.jpg!d"
#'       ),
#'       tinyslider_card(
#'         "id3",
#'         "bla bla",
#'         subtitle = NULL,
#'         content = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
#'       ),
#'       options = list(
#'         loop = TRUE,
#'         autoplay = TRUE,
#'         autoplayTimeout = 1000
#'       ),
#'       height = "2000px"
#'     )
#'   })
#' }
#'
#' shinyApp(ui, server, options = list(launch.browser = TRUE))
#' }
#'
#' @importFrom htmlwidgets createWidget
#' @importFrom shiny tags
#'
#' @export
tinyslider <- function(..., options = list(), width = NULL, height = NULL, elementId = NULL) {

    items <- list(...)

    # need to separate the plots from the regular items because
    # plots will be embedded in tags$img() but not the other items

    # create a subset with the plot encoded as images
    # i.e the items that start with "data:image/png"
    encoded_plots <- lapply(items, function(x) {
      first_letters <- substr(x, 1, 14)
      if (first_letters == "data:image/png") x else NA
    })

    # if none of the elements in encoded_plots is TRUE (i.e there are no NA),
    # then which(is.na(encoded_plots)) gives integer(0) and
    # encoded_plots[-which(is.na(encoded_plots))] gives an empty list
    # whereas every element is an encoded plot
    if (length(which(is.na(encoded_plots))) != 0) {
      encoded_plots <- encoded_plots[-which(is.na(encoded_plots))]
    }

    # remove these plots from items, so that we have two groups:
    # regular_items and encoded_plots
    items <- lapply(items, function(x) {
      first_letters <- substr(x, 1, 14)
      if (first_letters == "data:image/png") NA else x
    })
    if (length(which(is.na(encoded_plots))) != 0) {
      regular_items <- items[-which(is.na(items))]
    } else {
      regular_items <- items
    }


    mytag <- tags$div(
      class = "tinyslider-container",
      tags$div(
        class = "my-slider",
        regular_items,
        lapply(encoded_plots, function(x){
          tags$div(
            class = 'tinyslider-item',
            tags$div(
              class = 'card',
              tags$img(src = x)
            )
          )
        })
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
      package = 'tinyslider',
      elementId = elementId
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
