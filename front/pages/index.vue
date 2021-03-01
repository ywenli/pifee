<template>
  <v-container>
    hoge
  </v-container>
</template>

<script>
export default {
  components: {
  },
  layout ({ store }) {
    return store.state.loggedIn ? 'default' : 'welcome'
  }
}
</script>

<style>

</style>
