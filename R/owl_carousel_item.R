#' Title
#'
#' @param title title
#' @param subtitle subtitle
#' @param content content
#' @param button_text button
#' @param width Width, in the format "300px" (default value)
#'
#' @export
owl_carousel_item <- function(title, subtitle, content = NULL, button_text = NULL, width = "300px") {

  if (!is.null(button_text))
    button <- shiny::tags$div(class = "btn", value = button_text)
  else
    button <- NULL

  shiny::tags$div(
    class = "card",
    style = paste0("width: ", width),
    shiny::tags$div(class = "img"),
    shiny::tags$div(
      class = "content",
      shiny::tags$div(class = "title", title),
      shiny::tags$div(class = "sub-title", subtitle),
      shiny::tags$p(content),
      button
    )
  )

}
