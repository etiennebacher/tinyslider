#' Convert a plot to a card
#'
#' @param plot the name of a plot (works only for ggplots for now)
#'
#' @export
plot_to_card <- function(plot){

  if (!("gg" %in% class(plot)))
    stop("This function only works with ggplots")

  temp <- tempfile(fileext = ".png")

  on.exit({
    file.remove(temp)
  })

  ggplot2::ggsave(filename = temp, plot = plot)
  paste0("data:image/png;base64,", base64enc::base64encode(temp))
}