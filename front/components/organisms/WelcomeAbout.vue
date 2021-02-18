<template>
  <v-row class="WelcomeAbout">
    <v-col cols="12" md="6">
      <h1 class="AppTitle">Pifee</h1>
      <p>Pifeeはエンジニアのためのポートフォリオ共有サイトです。</p>
      <v-btn
        class="LoginButton"
        color="primary"
        rounded
        to="#"
        >はじめる
      </v-btn>
      <v-btn
        class="AboutButton"
        color="info"
        rounded
        to="#"
      >
        About Pifee
      </v-btn>
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
export default {
  data() {
    return {
    }
  },
}
</script>

<style>
.WelcomeAbout {
  padding-top: 40px;
  padding-bottom: 40px;
}
.LoginButton {
  font-weight: bold;
  margin-right: 1rem;
}
.AboutButton {
  text-transform: none;
  font-weight: bold;
}
</style>
