<template>
  <v-container>
    <nuxt-child />
  </v-container>
</template>

<script>
export default {
  middleware ({ route, redirect }) {
    if (route.name === 'account') { return redirect('/') }
  }
}
</script>
