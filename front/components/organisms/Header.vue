<template>
  <v-app-bar
    app
    dense
  >
    <v-appbar-title>
      <nuxt-link
        to="/"
        class="app-title-link"
        style="color:black;"
      >
        {{ appName }}
      </nuxt-link>
    </v-appbar-title>
  </v-app-bar>
</template>

<script>
export default {
  data ({ $config: { appName } }) {
    return {
      appName
    }
  }
}
</script>

<style>
.app-title-link {
  text-decoration: none;
}
</style>
