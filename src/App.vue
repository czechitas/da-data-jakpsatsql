<template>
  <v-app id="jak-psat-sql">
    <v-navigation-drawer v-model="drawer" fixed app dark id="app-drawer">
      <navigation></navigation>
    </v-navigation-drawer>

    <v-toolbar
    flat
    app
    prominent>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>{{ this.$router.currentRoute.meta.title }}</v-toolbar-title>
      <v-spacer></v-spacer>

        <span class="overline">
          &copy; 2019 by Ondřej Hošák and Pavel Chocholouš, source code is available on <a target="_blank" href="https://github.com/ondrej-hosak/JakPsatSQL">github</a>
        </span>
      
    </v-toolbar>

    <v-content style="backgrond: #eee;">
       <router-view/>
    </v-content>
  </v-app>
</template>

<script>
  import Navigation from './components/Navigation.vue'

  export default {
    components: {
      Navigation,
    },
    data: () => ({
      drawer: null
    }),
    props: {
      source: String
    }
  }
</script>

<style lang="scss">
  #jak-psat-sql { background:#eee;}
  .v-toolbar { background: #eee !important; }
  .v-card__text img { width: 400px; }
</style>