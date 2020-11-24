
test_that("plot_to_card accepts ggplots but not plots", {
  library(ggplot2)
  x <- ggplot(mtcars, aes(drat, mpg)) +
    geom_point()
  expect_message(plot_to_card(x), "Saving 7 x 7 in image")

  y <- plot(mtcars$mpg)
  expect_error(plot_to_card(y))
})


test_that("plot_to_card returns a character with the right beginning", {
  library(ggplot2)
  x <- ggplot(mtcars, aes(drat, mpg)) +
    geom_point()
  y <- plot_to_card(x)

  expect_type(y, "character")

  z <- substring(y, 1, 21)
  expect_equal(z, "data:image/png;base64")
})
