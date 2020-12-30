import Vue from "vue"
import Router from "vue-router"

import Home from "./components/Home"
import Theory from "./components/Theory"
import Database from "./components/Database"
import Relations from "./components/Relations"
import Practice from "./components/Practice"
import Tips from "./components/Tips"
import About from "./components/About"
import Notebook from "./components/Notebook"
//import LongStoryShort from "./components/LongStoryShort"

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: "/home",
      meta: { title: "Bylo nebylo", icon: "home" },
      name: "Home",
      component: Home,
    },
    {
      path: "/teorie",
      meta: { title: "Teorie", icon: "library" },
      name: "Theory",
      component: Theory,
    },
    {
      path: "/servery",
      meta: { title: "Databázový server a databáze", icon: "server" },
      name: "Database",
      component: Database,
    },
    {
      path: "/relace",
      meta: { title: "Fungující vztahy - relace", icon: "sync" },
      name: "Relations",
      component: Relations,
    },
    // {
    //   path: "/longstoryshort",
    //   meta: { title: "Long story short", icon: "print" },
    //   name: "LongStoryShort",
    //   component: LongStoryShort,
    // },
    {
      path: "/tips",
      meta: { title: "Užitečné", icon: "help" },
      name: "Tips",
      component: Tips,
    },
    {
      path: "/practice",
      meta: { title: "Výuka", icon: "school" },
      name: "Practice",
      component: Practice,
    },
    {
      path: "/about",
      meta: { title: "Autoři stránek", icon: "snowman" },
      name: "About",
      component: About,
    },
    {
        path: "/notebook",
        meta: { title: "Notebook", icon: "document" },
        name: "notebook",
        component: Notebook,
    },
    {
      path: "*",
      redirect: "/home",
      meta: { title: "all", icon: "help", hideInMenu: true }
    }  
  ],
})

export default router