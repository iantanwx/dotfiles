module.exports = {
  config: {
    // default working dir
    workingDirectory: '~/Development',

    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: '"Fira Code"',

    // terminal cursor background color (hex)
    cursorColor: '#F81CE5',

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#000000',

    // border color (window, tabs)
    borderColor: '#333',

    // custom css to embed in the main window
    css: `
      .tabs_nav {
        height: 18px;
      }

      .tabs_nav * {
        height: 100%;
      }

      .tab_icon {
        height: 14px;
        top: 2px;
      }

      .tab_shape {
        height: 6px;
      }

      .tab_textInner {
        font-size: 10px;
        line-height: 18px;
      }

      .terms_terms {
        margin-top: 18px;
      }
    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    termCSS: `
      x-screen x-row {
        font-variant-ligatures: initial;
      }
    `,

    padding: '0 0',

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: [
      '#000000',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#d0d0d0',
      '#808080',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#ffffff'
    ]
  },

  plugins: [
    // Alt buffer scrolling
    'hyperterm-alternatescroll',

    //// blinking cursor
    'hyperterm-blink',

    // 'hyperterm-base16-tomorrow-night',

    // 'hyperterm-resboned',

    'hyperterm-mactabs',

    // draggable tabs
    'hyperterm-tabs',

    // bold active tab
    'hyperterm-bold-tab',

    // // tab icons
    // 'hyperterm-tab-icons',

    //// add focus-gained/lost events
    'hyperterm-focus-reporting',

    //// respect xterm titles
    'hyperterm-title',

    // status bar
    'hyper-statusline',

    // clickable links in same window... buggy
    'hyperlinks',

    // default working directory
    'hyperterm-working-directory',
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
