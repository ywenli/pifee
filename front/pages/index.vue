<template>
  <v-container>
    hoge
  </v-container>
</template>

<script>
export default {
  components: {
  },
  layout ({ $auth }) {
    return $auth.loggedIn ? 'default' : 'welcome'
  }
}
</script>

<style>

</style>
