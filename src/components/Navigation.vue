<template>
    <v-list>
        <!-- <div v-for="(menuItem, i) in $router.options.routes" :key="i">
          <v-list-tile :to="{ name: menuItem.name }">
            <v-list-tile-action>
              <v-icon>{{ menuItem.meta.icon }}</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title class="body-1">{{ menuItem.meta.title }}</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </div> -->

        <v-list-tile avatar>
          <v-list-tile-avatar color="white">
            <v-img src="https://vuetifyjs.com/apple-touch-icon-180x180.png" height="34"/>
          </v-list-tile-avatar>

          <v-list-tile-title class="title">
            Jak psát SQL
          </v-list-tile-title>
        </v-list-tile>
        
        <v-divider style="padding-bottom: 15px;" />

        <v-list-tile
          v-for="(menuItem, i) in $router.options.routes"
          :key="i"
          :to="{ name: menuItem.name }"
          avatar
          class="v-list-item"
        >
          <v-list-tile-action>
            <v-icon>{{ menuItem.meta.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-title
            v-text="menuItem.meta.title"
          />
        </v-list-tile>
      </v-list>
</template>

<script>
export default {
  name: "Navigation",
  data () {
      return {
        logo: '../assets/logo.svg',
      }
    },
  mounted () {
		//$router.push({ name: 'test' });
  }
}
</script>

<style lang="scss">
  #app-drawer .v-list__tile--active {
      border-radius: 4px;
      background-color: #4caf50;
      color: white;
  }

  #app-drawer .v-list__tile {
      margin: 0px 15px;
  }

  #app-drawer .v-list__tile__action {
      color: white;
  }

  #app-drawer .v-list__tile__title {
      color: white;
  }
</style>