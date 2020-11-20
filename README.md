# tinyslider

[CAREFUL - WORK IN PROGRESS]

`tinyslider` is an R package that allows to create a carousel via the JavaScript library [tiny-slider](https://github.com/ganlanyuan/tiny-slider).

* [Installation](#installation)
* [tinyslider](#tinyslider)
    * [Standalone widget](#standalone-widget)
    * [In Shiny](#in-shiny)
    * [Include other elements](#other-elements)
+ [Code of Conduct](#code-of-conduct)

## Installation 

You can install this package with:

```r
# install.packages("devtools")
devtools::install_github("etiennebacher/tinyslider")
```

## tiny-slider

### Standalone widget

There are two main functions to create a carousel:
* `tinyslider_card()` allows to create a card, that can have an image, a title and subtitle, some text, and a button.
* `tinyslider()` is used to embed the cards created. This is also where you can specify [options](https://github.com/ganlanyuan/tiny-slider#options) provided by tiny-slider.

```r
tinyslider(
      id = "test",
      tinyslider_card(
        id = "id1",
        title = "A beautiful landscape",
        subtitle = "Where is this?",
        content = "A description of this image",
        image = "https://c.pxhere.com/photos/27/7b/scotland_centralscotland_benmore_stobbinnein_crianlarich_scotspine_mountains_landscape-267332.jpg!d"
      ),
      tinyslider_card(
        "id2",
        "A city now",
        "Same question",
        "There is a button below",
        button_text = "See more",
        image = "https://c.pxhere.com/photos/75/a5/granada_spain_city_urban_buildings_architecture_houses_homes-1122666.jpg!d"
      ),
      options = list(
        loop = TRUE,
        autoplay = TRUE
      )
    )
```

### In Shiny  

You can use `tinysliderOutput` and `renderTinyslider` in Shiny app. Here's a small demo:

```r
library(shiny)
library(tinyslider)

ui <- fluidPage(
    tinysliderOutput("test")
  )
  
server <- function(input, output, session) {

   output$test <- renderTinyslider({
    tinyslider(
      id = "test",
      tinyslider_card(
        id = "id1",
        title = "A beautiful landscape",
        subtitle = "Where is this?",
        content = "A description of this image",
        image = "https://c.pxhere.com/photos/27/7b/scotland_centralscotland_benmore_stobbinnein_crianlarich_scotspine_mountains_landscape-267332.jpg!d"
      ),
      tinyslider_card(
        "id2",
        "A city now",
        "Same question",
        "There is a button below",
        button_text = "See more",
        image = "https://c.pxhere.com/photos/75/a5/granada_spain_city_urban_buildings_architecture_houses_homes-1122666.jpg!d"
      ),
      options = list(
        loop = TRUE,
        autoplay = TRUE
      )
    )
  })

}

shinyApp(ui, server)
```

### Include other elements

You are not obliged to use the cards created with `tinyslider_card()`. You can include other elements, such as plots that you have created:

```r
library(shiny)
library(tinyslider)
library(ggplot2)

plot1 <- ggplot(mtcars, aes(drat, mpg)) +
  geom_point()

plot2 <- ggplot(mtcars, aes(hp, cyl)) +
  geom_line()

ui <- fluidPage(
  tinysliderOutput("test")
)
server <- function(input, output, session) {
  
  output$test <- renderTinyslider({
    tinyslider(
      plot_to_card(plot1), 
      tinyslider_card(
        "A city now",
        "Same question",
        "There is a button below",
        button_text = "See more",
        image = "https://c.pxhere.com/photos/75/a5/granada_spain_city_urban_buildings_architecture_houses_homes-1122666.jpg!d"
      ),
      plot_to_card(plot2),
      options = list(
        loop = TRUE,
        autoplay = TRUE
      )
    )
  })
}

shinyApp(ui, server)
```

Keep in mind that this is a very new package, and that I'm beginner in package development, especially Shiny widgets. All contributions are welcome!

## Code of Conduct
  
Please note that the tinyslider project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
