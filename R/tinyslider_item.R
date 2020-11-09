#' Create items for the tinyslider carousel
#'
#' @param id Id of the card
#' @param title Title of the card
#' @param subtitle Subtitle of the card
#' @param content Text of the card
#' @param button_text Display some text inside a button placed at the bottom of the card. If `NULL`, the button is not created.
#' @param image An image to place on top of the card.
#'
#' @export
tinyslider_item <- function(id, title = NULL, subtitle = NULL, content = NULL, button_text = NULL, image = NULL, width = NULL) {


  ### button
  if (!is.null(button_text)) {
    button <- shiny::tags$div(
      class = 'btn',
      shiny::tags$button(button_text)
    )
  } else {
    button <- NULL
  }

  ### image
  if (!is.null(image)) {
    pic <- shiny::tags$div(
      class = 'img',
      shiny::tags$img(src = image)
    )
  } else {
    pic <- NULL
  }


  mytag <- shiny::tags$div(
    class = 'tinyslider-item',
    shiny::tags$div(
      id = id,
      class = 'card',
      style = if (!is.null(width)) paste0('width: ', width),
      pic,
      shiny::tags$div(
        class = 'content',
        shiny::tags$div(class = 'title', title),
        shiny::tags$div(class = 'sub-title', subtitle),
        shiny::tags$p(content),
        button
      )
    )
  )

  return(mytag)

}
