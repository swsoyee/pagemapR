HTMLWidgets.widget({

  name: 'pagemap',

  type: 'output',

  factory: function (el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function (x) {
        const map = document.createElement('canvas');
        map.setAttribute("id", x.id);
        map.setAttribute("style", x.style);
        el.appendChild(map);
        pagemap(document.querySelector(`#${x.id}`), x.options);
      },

      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});