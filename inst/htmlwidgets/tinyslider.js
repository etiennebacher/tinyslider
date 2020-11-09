HTMLWidgets.widget({

  name: 'tinyslider',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        el.innerHTML = x.ui;

        const slider = tns(x.opts);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
