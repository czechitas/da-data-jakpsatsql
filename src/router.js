import Vue from "vue"
import Router from "vue-router"

import Home from "./components/Home"
import Theory from "./components/Theory"
import Database from "./components/Database"
import Relations from "./components/Relations"
import Practice from "./components/Practice"
import Tahak from "./components/Tahak"

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: "/",
      meta: { title: "Bylo nebylo", icon: "home" },
      name: "Home",
      component: Home,
    },
    {
      path: "teorie",
      meta: { title: "Teorie", icon: "language" },
      name: "Theory",
      component: Theory,
    },
    {
      path: "servery",
      meta: { title: "Databázový server a databáze", icon: "computer" },
      name: "Database",
      component: Database,
    },
    {
      path: "relace",
      meta: { title: "Fungující vztahy - relace", icon: "sync" },
      name: "Relations",
      component: Relations,
    },
    {
      path: "tahak",
      meta: { title: "Tahák", icon: "help" },
      name: "Tahak",
      component: Tahak,
    },
    {
      path: "practice",
      meta: { title: "Výuka", icon: "school" },
      name: "Practice",
      component: Practice,
    },  
  ],
})

export default router
