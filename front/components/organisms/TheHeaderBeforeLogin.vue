<template>
  <v-app-bar
    app
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
    <v-spacer />
    <BaseButton
      color="primary"
      to="/login"
      nuxt
    >
      ログイン
    </BaseButton>
  </v-app-bar>
</template>

<script>
import BaseButton from '../atoms/BaseButton.vue'
export default {
  components: { BaseButton },
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
