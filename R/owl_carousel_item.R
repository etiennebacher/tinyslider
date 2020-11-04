#' Title
#'
#' @param title title
#' @param subtitle subtitle
#' @param content content
#' @param button_text button
#' @param width Width, in the format "300px" (default value)
#'
#' @export
owl_carousel_item <- function(id, title, subtitle, content = NULL, button_text = NULL, image = NULL) {


  ### button
  if (!is.null(button_text))
    button <- shiny::tags$div(
      class = "btn",
      tags$button(button_text)
    )
  else
    button <- NULL

  ### image
  if (!is.null(image))
    img <- shiny::tags$div(
      class = "img",
      tags$img(src = image)
    )
  else
    img <- NULL


  shiny::tags$div(
    id = id,
    class = "card",
    # style = paste0("width: ", width),
    img,
    shiny::tags$div(
      class = "content",
      shiny::tags$div(class = "title", title),
      shiny::tags$div(class = "sub-title", subtitle),
      shiny::tags$p(content),
      button
    )
  )

}
