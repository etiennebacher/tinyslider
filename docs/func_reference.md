# Reference


`plot_to_card` : Convert a plot to a card
 <details>
 <summary> More </summary> 
 
 **Usage:** 
 ``` 
plot_to_card(plot)

 ``` 
 
 **Arguments:** 
* `plot`: the name of a plot (works only for plots with the class `gg` for now).
 


 **Examples:** 
 ```
library(ggplot2)

plot1 <- ggplot(mtcars, aes(hp, drat)) +
  geom_point()

tinyslider(plot_to_card(plot1))

 ```
 </details> 
 
--- 
 
`tinyslider-shiny` : Shiny bindings for tinyslider
 <details>
 <summary> More </summary> 
 
 **Usage:** 
 ``` 
tinysliderOutput(outputId, width = "100\%", height = "400px")

renderTinyslider(expr, env = parent.frame(), quoted = FALSE)

 ``` 
 
 **Arguments:** 
* `outputId`: output variable to read from
 
* `width, height`: Must be a valid CSS unit (like `'100\%'`,
`'400px'`, `'auto'`) or a number, which will be coerced to a
string and have `'px'` appended.
 
* `expr`: An expression that generates a tinyslider
 
* `env`: The environment in which to evaluate `expr`.
 
* `quoted`: Is `expr` a quoted expression (with `quote()`)? This
is useful if you want to save an expression in a variable.
 


 </details> 
 
--- 
 
`tinyslider` : Create a carousel with tinyslider
 <details>
 <summary> More </summary> 
 
 **Usage:** 
 ``` 
tinyslider(
  elementId = NULL,
  ...,
  options = list(),
  responsive_options = list()
)

 ``` 
 
 **Arguments:** 
* `elementId`: Id of the carousel
 
* `...`: Items created with `tinyslider_card()`, or plots embedded in `plot_to_card`.
 
* `options`: List of options for the carousel.
 
* `responsive_options`: List of options that differ according to viewport size. See the examples.
 


 **Examples:** 
 ```
tinyslider(
  tinyslider_card(
    title = "First title",
    subtitle = "First subtitle",
    content = paste0(
      "Lorem Ipsum is simply dummy text of",
      "the printing and typesetting industry. Lorem Ipsum has been the",
      "industry's standard dummy text ever since the 1500s,",
      "when an unknown printer took a galley of type and scrambled",
      "it to make a type specimen book."
    ),
    image = "https://placeimg.com/200/150/nature"
  ),
  tinyslider_card(
    "Second title",
    "Second subtitle",
    "There is a button below",
    button_text = "See more",
    image = "https://placeimg.com/200/150/nature/2"
  ),
  tinyslider_card(
    "Third title",
    subtitle = NULL,
    content = paste0(
      "Lorem Ipsum is simply dummy text of",
      "the printing and typesetting industry. Lorem Ipsum has been",
      "the industry's standard dummy text ever since the 1500s,",
      "when an unknown printer took a galley of type and",
      "scrambled it to make a type specimen book. It has",
      "survived not only five centuries, but also the leap into",
      "electronic typesetting, remaining essentially unchanged.",
      "It was popularised in the 1960s with the",
      "release of Letraset sheets containing Lorem Ipsum passages,",
      "and more recently with desktop publishing",
      "software like Aldus PageMaker including versions of Lorem Ipsum."
    )
  ),
  options = list(
    loop = TRUE,
    autoplay = TRUE,
    autoplayTimeout = 1000
  )
)

 ```
 </details> 
 
--- 
 
`tinyslider_cards` : Create cards for the tinyslider carousel
 <details>
 <summary> More </summary> 
 
 **Usage:** 
 ``` 
tinyslider_card(
  title = NULL,
  subtitle = NULL,
  content = NULL,
  button_text = NULL,
  image = NULL,
  width = NULL
)

tinyslider_card_2(
  title = NULL,
  subtitle = NULL,
  content = NULL,
  button_text = NULL,
  image = NULL,
  width = NULL
)

 ``` 
 
 **Arguments:** 
* `title`: Title of the card
 
* `subtitle`: Subtitle of the card
 
* `content`: Text of the card
 
* `button_text`: Display some text inside a button placed at the bottom of the card. If `NULL`, the button is not created.
 
* `image`: An image to place on top of the card.
 
* `width`: Width of the card as a character, in px or in \%.
 


 **Examples:** 
 ```
tinyslider_card("This is a title", "This is a subtitle")
 ```
 </details> 
 
--- 
 
