html_dependency_owlcarousel <- function() {
  htmltools::htmlDependency(
    name = "owl.carousel",
    version = "2.3.4",
    package = "shinymisc",
    src = "htmlwidgets/owl_carousel",
    script = c("owl.carousel.min.js", "owl.carousel.js"),
    stylesheet = c("owl.carousel.min.css", "style.css"),
    all_files = FALSE
  )
}
