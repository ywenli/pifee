<template>
  <v-container class="join__container">
    <v-row justify="center">
      <v-col cols="12" sm="6" md="6">
        <div class="join__sentense">
          <p class="join__title display-2 font-weight-medium">Join pifee</p>
          <p class="headline">Let's share your works!</p>
        </div>
        <BaseButton
          class="join__button__login"
          to="#"
          color="primary"
        >
          はじめる
        </BaseButton>
      </v-col>
      <v-col cols="12" sm="6" md="6">
        <img
          src="../../assets/image/home/well_done.svg"
          width="400"
          height="255"
        >
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import BaseButton from '../atoms/BaseButton.vue'

export default {
  components: { BaseButton },

}
</script>

<style>
.join__container {
  padding: 40px 0 40px 0;
}
.join__sentense {
  padding: 60px 0 20px 40px;
}
.join__button__login {
  margin-left: 40px;
}
</style>
