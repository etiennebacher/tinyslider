test_that("tinyslider_card doesn't need any argument", {
  x <- tinyslider_card()
  y <- tinyslider_card_2()
  expect_silent(x)
  expect_silent(y)
})

test_that("tinyslider_card produces shiny elements", {
  x <- tinyslider_card()
  y <- tinyslider_card_2()
  expect_s3_class(x, "shiny.tag")
  expect_s3_class(y, "shiny.tag")
})

test_that("tinyslider_card produces the right HTML structure", {
  x <- tinyslider_card()
  expect_equal(x$attribs$class, "tinyslider-item")
  expect_equal(x$children[[1]]$attribs$class, "card")
  expect_equal(x$children[[1]][[3]][[2]]$attribs$class, "content")

  y <- tinyslider_card_2()
  expect_equal(y$attribs$class, "tinyslider-item")
  expect_equal(y$children[[1]][[2]]$class, "card")
  expect_equal(y$children[[1]][[3]][[1]]$attribs$class, "card-row")
  expect_equal(y$children[[1]][[3]][[1]]$children[[1]]$attribs$class, "card-column")
})





