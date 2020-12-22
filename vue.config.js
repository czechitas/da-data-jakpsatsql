module.exports = {
  "transpileDependencies": [
    "vuetify"
  ]
}

var webpack = require("webpack")

module.exports = {
  configureWebpack: {
    plugins: [new webpack.ContextReplacementPlugin(/moment[/\\]locale$/, /(en|cs)$/)],
    entry: "./src/main.js",
    module: {
        rules: [
            {
                test: /\.(csv)$/,
                use: [{ loader: "file-loader", options: { name: "static/[name].csv"}}],
            },
        ]
    }
  }
}