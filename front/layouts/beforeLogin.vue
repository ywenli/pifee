<template>
  <v-app>
    <TheHeaderBeforeLogin />
    <v-main>
      <nuxt />
    </v-main>
    <TheFooter />
  </v-app>
</template>

<script>
import TheHeaderBeforeLogin from '../components/organisms/TheHeaderBeforeLogin.vue'
import TheFooter from '../components/organisms/TheFooter.vue'
export default {
  components: { TheHeaderBeforeLogin, TheFooter }
  // middleware: 'redirectLoggedInUser' TODO: リダイレクトされない問題を解消
}
</script>
