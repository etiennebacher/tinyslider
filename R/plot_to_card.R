#' Convert a plot to a card
#'
#' @param plot the name of a plot (works only for plots with the class `gg` for now).
#'
#' @return A character vector containing the plot encoded in base64. Therefore, this function should only be used in `tinyslider()`.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' plot1 <- ggplot(mtcars, aes(hp, drat)) +
#'   geom_point()
#'
#' tinyslider(plot_to_card(plot1))
#' }
#' @importFrom ggplot2 ggsave
#' @importFrom base64enc base64encode
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
