HTMLWidgets.widget({

  name: 'pagemap',

  type: 'output',

  factory: function (el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function (x) {
        const map = document.createElement('canvas');
        map.setAttribute("id", x.id);
        map.style.position = 'fixed';
        map.style.top = '0';
        map.style.right = '0';
        map.style.width = '200px';
        map.style.height = '100%';
        map.style.zIndex = '100';
        el.appendChild(map);
        pagemap(document.querySelector(`#${x.id}`), {
          viewport: null,
          styles: {
            'header,footer,section,article': 'rgba(0,0,0,0.08)',
            'h1,a': 'rgba(0,0,0,0.10)',
            'h2,h3,h4': 'rgba(0,0,0,0.08)',
            'p': 'rgba(0,0,0,0.04',
          },
          back: 'rgba(0,0,0,0.02)',
          view: 'rgba(0,0,0,0.05)',
          drag: 'rgba(0,0,0,0.10)',
          interval: null
        });
      },

      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});