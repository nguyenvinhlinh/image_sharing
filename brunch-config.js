exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(web\/static\/js|node_modules)/,
        "js/vendor.js": /^(web\/static\/vendor)/
      },
      order: {
        before: [
          "web/static/vendor/jquery-3.2.0/jquery-3.2.0.js",
          "web/static/vendor/foundation-6.3.1/js/foundation.js",
          "web/static/vendor/clipboard-1.6.1/clipboard.js"
        ]
      }
    },
    stylesheets: {
      joinTo: {
        "css/app.css": /^(web\/static\/css)/,
        "css/vendor.css": /^(web\/static\/vendor)/
      }
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },
  npm: {
    enabled: true
  }
};
