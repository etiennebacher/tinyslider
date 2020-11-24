test_that("tinyslider has the good classes", {
  x <- tinyslider(
    tinyslider_card(
      title = "First title",
      subtitle = "First subtitle",
      content = "Lorem Ipsum is simply dummy text of",
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
      content = "Lorem Ipsum is simply dummy text of"
    )
  )

  expect_s3_class(x, "htmlwidget")
  expect_s3_class(x, "tinyslider")
})


test_that("tinyslider has the right characteristics", {
  x <- tinyslider(
    tinyslider_card(
      title = "First title",
      subtitle = "First subtitle",
      content = "Lorem Ipsum is simply dummy text of",
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
      content = "Lorem Ipsum is simply dummy text of"
    ),
    elementId = "test_id"
  )

  expect_equal(
    x$elementId,
    "test_id"
  )
  expect_equal(
    x$x$opts,
    list(container = ".my-slider", responsive = list())
  )
  expect_equal(
    x$x$ui,
    "<div class=\"tinyslider-container\">\n  <div class=\"my-slider\">\n    <div class=\"tinyslider-item\">\n      <div class=\"card\">\n        <div class=\"img\">\n          <img src=\"https://placeimg.com/200/150/nature\"/>\n        </div>\n        <div class=\"content\">\n          <h2>First title</h2>\n          <h3>First subtitle</h3>\n          <p>Lorem Ipsum is simply dummy text of</p>\n        </div>\n      </div>\n    </div>\n    <div class=\"tinyslider-item\">\n      <div class=\"card\">\n        <div class=\"img\">\n          <img src=\"https://placeimg.com/200/150/nature/2\"/>\n        </div>\n        <div class=\"content\">\n          <h2>Second title</h2>\n          <h3>Second subtitle</h3>\n          <p>There is a button below</p>\n          <div class=\"btn\">\n            <button>See more</button>\n          </div>\n        </div>\n      </div>\n    </div>\n    <div class=\"tinyslider-item\">\n      <div class=\"card\">\n        <div class=\"content\">\n          <h2>Third title</h2>\n          <h3></h3>\n          <p>Lorem Ipsum is simply dummy text of</p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>"
  )
})

