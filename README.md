# shinymisc

`shinymisc` is an R package that ultimately will contain several widgets for R Shiny. For now, it only contains functions to create a carousel via the JavaScript library [Owl Carousel 2](https://owlcarousel2.github.io/OwlCarousel2/).

## Installation 

You can install this package with:

```
# install.packages("devtools")
devtools::install_github("etiennebacher/shinymisc")
```

## Demo

### Owl Carousel 2

There are two main functions to create a carousel:
* `owl_carousel_item()` allows to create a card, that can have an image, a title and subtitle, some text, and a button.
* `owl_carousel()` is used to embed the items created. This is also where you can specify [options](https://owlcarousel2.github.io/OwlCarousel2/docs/api-options.html) provided by Owl Carousel 2.

Here's a small demo:

```
library(shiny)
library(shinymisc)

ui <- fluidPage(
  owl_carousel(
    id = "test",
    owl_carousel_item(
      id = "id1",
      title = "A beautiful landscape",
      subtitle = "Where is this?",
      content = "A description of this image",
      image = "https://c.pxhere.com/photos/27/7b/scotland_centralscotland_benmore_stobbinnein_crianlarich_scotspine_mountains_landscape-267332.jpg!d"
    ),
    owl_carousel_item(
      "id2",
      "A city now",
      "Same question",
      "There is a button below",
      button_text = "See more",
      image = "https://c.pxhere.com/photos/75/a5/granada_spain_city_urban_buildings_architecture_houses_homes-1122666.jpg!d"
    ),
    owl_carousel_item(
      "id3",
      "Some green to finish",
      subtitle = NULL,
      content = NULL,
      button_text = "Read more",
      image = "https://c.pxhere.com/photos/0d/4a/canopy_countryside_backroad_tree_nature-500326.jpg!d"
    ),
    options = list(
      autoplay = TRUE,
      loop = TRUE,
      autoplayTimeout = 2000
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
```

Keep in mind that this is a very new package, and that I'm beginner in package development, especially Shiny widgets. All contributions are welcome!

## Code of Conduct
  
Please note that the shinymisc project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
