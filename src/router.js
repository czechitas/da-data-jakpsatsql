import Vue from "vue"
import Router from "vue-router"

import Home from "./components/Home"
import Theory from "./components/Theory"
import Database from "./components/Database"
import Relations from "./components/Relations"
import Practice from "./components/Practice"

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: "/",
      meta: { title: "Homepage", icon: "home" },
      name: "Home",
      component: Home,
    },
    {
      path: "teorie",
      meta: { title: "Teorie", icon: "cancel" },
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
      meta: { title: "Fungující vztahy - relace", icon: "pregnant_woman" },
      name: "Relations",
      component: Relations,
    },
    {
      path: "practice",
      meta: { title: "Praxe", icon: "create" },
      name: "Practice",
      component: Practice,
    },  
  ],
})

export default router
