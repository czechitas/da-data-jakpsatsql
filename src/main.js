import Vue from 'vue'
import './plugins/vuetify'
import theme from './theme'
import Vuetify from "vuetify"
import App from './App.vue'
import router from "./router"

Vue.config.productionTip = false

Vue.use(Vuetify, {
  theme
})

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')



