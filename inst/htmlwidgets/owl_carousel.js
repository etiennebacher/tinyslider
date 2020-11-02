HTMLWidgets.widget({

  name: 'owl_carousel',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.innerHTML = x.message;

        $(".slider").owlCarousel({
          loop: true,
          autoplay: true,
          autoplayTimeout: 2000, //2000ms = 2s;
          autoplayHoverPause: true,
        })

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
