<template>
  <v-app>
    <TheHeaderAfterLogin />
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
    <TheFooter />
  </v-app>
</template>

<script>
import TheHeaderAfterLogin from '../components/organisms/TheHeaderAfterLogin.vue'
import TheFooter from '../components/organisms/TheFooter.vue'
export default {
  components: { TheHeaderAfterLogin, TheFooter }
}
</script>
