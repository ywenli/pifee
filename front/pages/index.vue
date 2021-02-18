<template>
  <v-container>
    <WelcomeAbout />
    <WelcomePopular />
    <WelcomeCategory />
    <WelcomeJoin />
  </v-container>
</template>

<script>
import WelcomeAbout from '@/components/organisms/WelcomeAbout.vue'
import WelcomePopular from '../components/organisms/WelcomePopular.vue'
import WelcomeCategory from '../components/organisms/WelcomeCategory.vue'
import WelcomeJoin from '../components/organisms/WelcomeJoin.vue'
export default {
  components: {
    WelcomeAbout,
    WelcomePopular,
    WelcomeCategory,
    WelcomeJoin,
  }
}
</script>

<style>

</style>
