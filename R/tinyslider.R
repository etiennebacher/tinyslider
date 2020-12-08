#' Create a carousel with tinyslider
#'
#' @param elementId Id of the carousel
#' @param ... Items created with `tinyslider_card()`, or plots embedded in `plot_to_card`.
#' @param options List of options for the carousel.
#' @param responsive_options List of options that differ according to viewport size. See the examples.
#'
#' @details Due to its length, I do not detail the list of options available. This list is available [here](https://github.com/ganlanyuan/tiny-slider#options).
#'
#' WARNING: the option "container" is automatically set in the function and therefore should not be modified.
#'
#'
#' @return An htmlwidget visible in RStudio viewer or in a web browser. This htmlwidget can be stored into an object (such as `x <- tinyslider()`.
#'
#' @examples
#' \dontrun{
#' tinyslider(
#'   tinyslider_card(
#'     title = "First title",
#'     subtitle = "First subtitle",
#'     content = paste0(
#'       "Lorem Ipsum is simply dummy text of",
#'       "the printing and typesetting industry. Lorem Ipsum has been the",
#'       "industry's standard dummy text ever since the 1500s,",
#'       "when an unknown printer took a galley of type and scrambled",
#'       "it to make a type specimen book."
#'     ),
#'     image = "https://placeimg.com/200/150/nature"
#'   ),
#'   tinyslider_card(
#'     "Second title",
#'     "Second subtitle",
#'     "There is a button below",
#'     button_text = "See more",
#'     image = "https://placeimg.com/200/150/nature/2"
#'   ),
#'   tinyslider_card(
#'     "Third title",
#'     subtitle = NULL,
#'     content = paste0(
#'       "Lorem Ipsum is simply dummy text of",
#'       "the printing and typesetting industry. Lorem Ipsum has been",
#'       "the industry's standard dummy text ever since the 1500s,",
#'       "when an unknown printer took a galley of type and",
#'       "scrambled it to make a type specimen book. It has",
#'       "survived not only five centuries, but also the leap into",
#'       "electronic typesetting, remaining essentially unchanged.",
#'       "It was popularised in the 1960s with the",
#'       "release of Letraset sheets containing Lorem Ipsum passages,",
#'       "and more recently with desktop publishing",
#'       "software like Aldus PageMaker including versions of Lorem Ipsum."
#'     )
#'   ),
#'   options = list(
#'     loop = TRUE,
#'     autoplay = TRUE,
#'     autoplayTimeout = 1000
#'   )
#' )
#' }
#'
#' @importFrom htmlwidgets createWidget
#' @importFrom shiny tags
#'
#' @export
tinyslider <- function(..., options = list(), responsive_options = list(), elementId = NULL) {

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
    options[["responsive"]] <- responsive_options

    x <- list(
      ui = as.character(mytag),
      opts = options
    )

    createWidget(
      name = 'tinyslider',
      x,
      package = 'tinyslider',
      elementId = elementId
    )

}


#' Shiny bindings for tinyslider
#'
#' Output and render functions for using tinyslider within Shiny
#' applications and interactive Markdown documents.
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
#' @examples
#' if (interactive()) {
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
#'       tinyslider_card(
#'         title = "First title",
#'         subtitle = "First subtitle",
#'         content = paste0("Lorem Ipsum is simply dummy text of the",
#'         "printing and typesetting industry. Lorem Ipsum has been the",
#'          "industry's standard dummy text ever since the 1500s, when",
#'          "an unknown printer took a galley of type and scrambled",
#'           "it to make a type specimen book."),
#'         image = "https://placeimg.com/200/150/nature"
#'       ),
#'       tinyslider_card(
#'         "Second title",
#'         "Second subtitle",
#'         "There is a button below",
#'         button_text = "See more",
#'         image = "https://placeimg.com/200/150/nature/2"
#'       ),
#'       tinyslider_card(
#'         "Third title",
#'         subtitle = NULL,
#'         content = paste0("Lorem Ipsum is simply dummy text of the",
#'         "printing and typesetting industry. Lorem Ipsum has been",
#'         "the industry's standard dummy text ever since the",
#'         "1500s, when an unknown printer took a galley of type and",
#'         "scrambled it to make a type specimen book. It has",
#'         "survived not only five centuries, but also the leap into",
#'         "electronic typesetting, remaining essentially unchanged.",
#'         "It was popularised in the 1960s with the",
#'         "release of Letraset sheets containing Lorem Ipsum passages,",
#'         "and more recently with desktop publishing",
#'         "software like Aldus PageMaker including versions of Lorem Ipsum.")
#'       ),
#'       options = list(
#'         loop = TRUE,
#'         autoplay = TRUE,
#'         autoplayTimeout = 1000
#'       )
#'     )
#'   })
#' }
#'
#' shinyApp(ui, server, options = list(launch.browser = TRUE))
#' }
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
