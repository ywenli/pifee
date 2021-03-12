<template>
  <v-card
    flat
    :to='to'
  >
    <div class="d-flex flex-no-wrap justify-space-between">
      <div>
        <v-card-title
          class="headline"
        >
          <slot name="title" />
        </v-card-title>

        <!-- TODO: ユーザー名とアイコンを表示する -->
        <v-card-subtitle>
          <slot name="user_id" />
        </v-card-subtitle>
      </div>

      <v-avatar
        class="ma-3"
        size="125"
        tile
      >
        <!-- TODO: workの画像を取得する -->
        <v-img :src='"https://cdn.vuetifyjs.com/images/cards/foster.jpg"' />
      </v-avatar>
    </div>
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
