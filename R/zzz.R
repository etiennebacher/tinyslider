.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "tinyslider-assets",
    system.file("htmlwidgets/tinyslider", package = "shinymisc")
  )
}
