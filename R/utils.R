#' Convert a plot to a card
#'
#' @param gg the name of a plot (works only for ggplots for now)
#'
#' @export
#'
#' @examples
plot_to_card <- function(gg){
  temp <- tempfile(fileext = ".png")

  on.exit({
    file.remove(temp)
  })

  ggplot2::ggsave(filename = temp, plot = gg)
  paste0("data:image/png;base64,", base64enc::base64encode(temp))
}
