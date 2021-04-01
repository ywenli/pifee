<template>
  <v-app>
    <TheHeaderBeforeLogin />
    <v-main>
      <v-container>
        <WelcomeAbout />
        <WelcomePopular />
        <WelcomeCategory />
        <WelcomeJoin />
      </v-container>
    </v-main>
    <TheFooter />
  </v-app>
</template>

<script>
import TheHeaderBeforeLogin from '@/components/organisms/TheHeaderBeforeLogin.vue'
import WelcomeAbout from '@/components/organisms/WelcomeAbout.vue'
import WelcomePopular from '@/components/organisms/WelcomePopular.vue'
import WelcomeCategory from '@/components/organisms/WelcomeCategory.vue'
import WelcomeJoin from '@/components/organisms/WelcomeJoin.vue'
import TheFooter from '../components/organisms/TheFooter.vue'
export default {
  components: {
    TheHeaderBeforeLogin,
    WelcomeAbout,
    WelcomePopular,
    WelcomeCategory,
    WelcomeJoin,
    TheFooter
  }
}
</script>

<style>

</style>
