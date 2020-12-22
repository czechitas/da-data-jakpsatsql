<template>
  <div>
    <v-list>
        <v-list-item>
          <v-list-item-avatar color="white">
            <img src="../assets/sql-logo.png" />
          </v-list-item-avatar>
          <v-list-item-title class="title">
            Jak psát SQL
          </v-list-item-title>
        </v-list-item>
        
        <v-divider style="padding-bottom: 15px;" />

        <div v-for="(menuItem, i) in $router.options.routes" :key="i">
          <div v-if="!menuItem.meta.hideInMenu">
              <v-list-item :to="{ name: menuItem.name }" class="v-list-item">
                <v-list-item-action>
                  <v-icon>mdi-{{ menuItem.meta.icon }}</v-icon>
                </v-list-item-action>
                <v-list-item-title v-text="menuItem.meta.title" />
              </v-list-item>
          </div>
        </div>
    </v-list>
  </div>
</template>

<script>
export default {
  name: "Navigation"
}
</script>



<style scoped>
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