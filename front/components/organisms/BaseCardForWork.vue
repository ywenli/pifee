<template>
  <v-card
    class='mx-auto'
    max-width='256'
    height='100%'
    elevation='1'
    :to='to'
    nuxt
  >
    <!-- TODO: workの画像を取得する -->
    <v-img
      :src='"https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"'
      height="150px"
    />

    <v-card-title
      class="headline"
    >
      <slot name="title" />
    </v-card-title>

    <!-- TODO: ユーザー名とアイコンを表示する -->
    <v-card-subtitle>
      <slot name="name" />
    </v-card-subtitle>
  </v-card>
</template>

<script>
export default {
  props: {
    to: {
      type: String,
      default: ''
    }
  },
  data () {
    return {

    }
  }
}
</script>

<style>

</style>
