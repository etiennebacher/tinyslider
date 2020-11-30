## Standalone widget

There are two main functions to create a carousel:
* `tinyslider_card()` allows to create a card, that can have an image, a title and subtitle, some text, and a button.
* `tinyslider()` is used to embed the cards created. This is also where you can specify [options](https://github.com/ganlanyuan/tiny-slider#options) provided by tiny-slider.

```r
tinyslider(
      id = "test",
      tinyslider_card(
        title = "A beautiful landscape",
        subtitle = "Where is this?",
        content = "A description of this image",
        image = "https://c.pxhere.com/photos/27/7b/scotland_centralscotland_benmore_stobbinnein_crianlarich_scotspine_mountains_landscape-267332.jpg!d"
      ),
      tinyslider_card(
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

*[top↑](#tinyslider)*

## In Shiny  

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
        title = "A beautiful landscape",
        subtitle = "Where is this?",
        content = "A description of this image",
        image = "https://c.pxhere.com/photos/27/7b/scotland_centralscotland_benmore_stobbinnein_crianlarich_scotspine_mountains_landscape-267332.jpg!d"
      ),
      tinyslider_card(
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

*[top↑](#tinyslider)*

## Include other elements

You are not obliged to use the cards created with `tinyslider_card()` (or `tinyslider_card_2()`. You can include other elements, such as plots that have a `gg` class, with the function `plot_to_card()`. This function converts plots in images, which means that it is impossible to have interactive plots, created by `{plotly}` or `{echarts4r}` for instance.

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

*[top↑](#tinyslider)*
