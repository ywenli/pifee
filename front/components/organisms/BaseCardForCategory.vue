<template>
  <v-card
    class="ma-auto"
    flat
    outlined
    :to="to"
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
        <img :src="src">
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
    },
    to: {
      type: String,
      default: ''
    },
    src: {
      type: String,
      default: ''
    }
  }
}
</script>

<style>

</style>
