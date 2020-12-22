import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import router from "./router";
import Viewer from "v-viewer";
import VueAnalytics from "vue-analytics";
import VueHighlightJS from "vue-highlightjs";
import sql from "highlight.js/lib/languages/sql";
require("../node_modules/highlight.js/styles/atelier-savanna-light.css");
require("../node_modules/highlight.js/styles/ir-black.css");
import 'viewerjs/dist/viewer.css'


Vue.config.productionTip = false

Vue.use(Viewer);

Vue.use(VueHighlightJS, {
  languages: {
    sql
  }
});

Vue.use(VueAnalytics, {
  id: "UA-147736707-1",
  router,
  debug: {
    sendHitTask: process.env.NODE_ENV === 'production'
  }
});

new Vue({
  vuetify,
  router,
  render: h => h(App)
}).$mount("#app");