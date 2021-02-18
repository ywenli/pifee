<template>
  <v-row class="welcome-page__about">
    <v-col cols="12" md="6">
      <h1 class="AppTitle">Pifee</h1>
      <p>Pifeeはエンジニアのためのポートフォリオ共有サイトです。</p>
      <BaseButton
        class="button__login"
        to="#"
        color="primary"
      >
        はじめる
      </BaseButton>
      <BaseButton
        class="button__about"
        to="#"
        color="grey lighten-5"
      >
        About Pifee
      </BaseButton>
    </v-col>
    <v-col cols="12" md="6">
      <img
        src="~/assets/image/home/content_team.svg"
        width="400"
        height="255"
        alt="トップ画像"
      />
    </v-col>
  </v-row>
</template>

<script>
import BaseButton from '../atoms/BaseButton.vue'
export default {
  components: { BaseButton },
  data() {
    return {
    }
  },
}
</script>

<style>
.welcome-page__about {
  padding-top: 40px;
  padding-bottom: 40px;
}
.button__login {
  margin-right: 1rem;
}
</style>
