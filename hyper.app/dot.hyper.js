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
    backgroundColor: '#000',

    // border color (window, tabs)
    borderColor: '#333',

    // custom css to embed in the main window
    css: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    termCSS: '',

    // custom padding
    padding: '12px 14px',

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

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hypersolar`
  //   `@company/project`
  plugins: [
  //   `project#1.0.1`
    // Alt buffer scrolling
    'hyperterm-alternatescroll',

    //// blinking cursor
    'hyperterm-blink',

    // material colour theme
    'hyper-material-theme',

    // 'hyperterm-base16-tomorrow-night',

    // 'hyperterm-resboned',

    // // fancy tabs
    // 'hyperterm-mactabs',

    // draggable tabs
    'hyperterm-tabs',

    // bold active tab
    'hyperterm-bold-tab',

    // tab icons
    'hyperterm-tab-icons',

    //// add focus-gained/lost events
    'hyperterm-focus-reporting',

    //// respect xterm titles
    'hyperterm-title',

    // status bar
    'hyperline',

    // clickable links in same window... buggy
    'hyperlinks',

    // default working directory
    'hyperterm-working-directory'

    //// clickable links, but behave like iterm... buggy
    //'hyperlinks-iterm',
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
