import Vue from "vue";
import Viewer from "v-viewer";
import "./plugins/vuetify";
import theme from "./theme";
import Vuetify from "vuetify";
import App from "./App.vue";
import router from "./router";
//code highlighting (sql)
import VueHighlightJS from "vue-highlightjs";
import sql from "highlight.js/lib/languages/sql";
require("../node_modules/highlight.js/styles/atelier-savanna-light.css");
Vue.config.productionTip = false;

/*
 * Use Vue Highlight.js
 */
Vue.use(VueHighlightJS, {
  // Register only languages that you want
  languages: {
    sql
  }
});

Vue.use(Vuetify, {
  theme
});

Vue.use(Viewer);

new Vue({
  router,
  render: h => h(App)
}).$mount("#app");
