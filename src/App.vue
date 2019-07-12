<template>
  <v-app id="jak-psat-sql">
    <v-navigation-drawer
      v-model="drawer"
      fixed
      app
    >

      <v-list dense>
        <div v-for="(menuItem, i) in $router.options.routes" :key="i">
          <v-list-tile :to="{ name: menuItem.name }">
            <v-list-tile-action>
              <v-icon>{{ menuItem.meta.icon }}</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>{{ menuItem.meta.title }}</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </div>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar color="cyan" dark fixed app>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Jak psát SQL</v-toolbar-title>
    </v-toolbar>
    <v-content>
       <router-view/>
    </v-content>
    <v-footer color="cyan" dark height="auto" app>
      <v-card flat tile class="cyan white--text text-xs-center">
       <v-card-text class="white--text pt-0">
        &copy; 2019 by Ondřej Hošák and Pavel Chocholouš, source code is available on <a target="_blank" href="https://github.com/ondrej-hosak/JakPsatSQL">github</a>
       </v-card-text>
      </v-card>
    </v-footer>
  </v-app>
</template>

<script>
  export default {
    data: () => ({
      drawer: null
    }),
    props: {
      source: String
    }
  }
</script>
