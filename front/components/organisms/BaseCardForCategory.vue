<template>
  <v-card
    class="ma-auto"
    flat
    outlined
    :to='to'
    nuxt
  >
    <v-row no-gutters justify='center'>
      <v-card-subtitle
        class="pt-３ pb-0"
      >
        <slot />
      </v-card-subtitle>
    </v-row>
    <v-row no-gutters justify='center' class='mt-0'>
      <v-avatar
        class="my-3"
        size="48"
        tile
      >
        <img src="https://cdn.vuetifyjs.com/images/cards/foster.jpg" alt="alt">
      </v-avatar>
    </v-row>
  </v-card>
</template>

<script>
export default {
  props: {
    tags: {
      type: Array,
      default: () => []
    }
  }
}
</script>

<style>

</style>
