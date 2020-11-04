.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "owlcarousel-assets",
    system.file("inst", package = "shinymisc")
  )
}
