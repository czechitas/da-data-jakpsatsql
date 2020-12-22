<template>
  <v-app id="jak-psat-sql">

    <v-navigation-drawer v-model="drawer" fixed app dark id="app-drawer">
      <navigation></navigation>
    </v-navigation-drawer>

    <v-app-bar app>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>{{ this.$router.currentRoute.meta.title }}</v-toolbar-title>
    </v-app-bar>

    <v-spacer></v-spacer>

    <v-main style="background: #eee;" align-baseline>
      <v-container align-baseline>
       <router-view/>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Navigation from './components/Navigation';


export default {
  name: 'App',

  components: {
    Navigation
  },
  data: () => ({
      drawer: null
    }),
    props: {
      source: String
    }
};
</script>


<style lang="scss">
  #jak-psat-sql { background:#eee;}
  //.v-toolbar { background: #eee !important; }
  .v-card__text img { width: 400px; }
</style>