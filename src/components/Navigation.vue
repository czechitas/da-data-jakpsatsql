<template>
    <v-list>
        <v-list-tile avatar>
          <v-list-tile-avatar color="white">
            <img src="../assets/sql-logo.png" />
          </v-list-tile-avatar>
          <v-list-tile-title class="title">
            Jak psát SQL
          </v-list-tile-title>
        </v-list-tile>
        
        <v-divider style="padding-bottom: 15px;" />

        <div v-for="(menuItem, i) in $router.options.routes" :key="i">
          <div v-if="!menuItem.meta.hideInMenu">
              <v-list-tile :to="{ name: menuItem.name }" avatar class="v-list-item">
                <v-list-tile-action>
                  <v-icon>{{ menuItem.meta.icon }}</v-icon>
                </v-list-tile-action>
                <v-list-tile-title v-text="menuItem.meta.title" />
              </v-list-tile>
          </div>
        </div>
      </v-list>
</template>

<script>
export default {
  name: "Navigation",
  data () {
    return {
      logo: '../assets/logo.svg',
    }
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