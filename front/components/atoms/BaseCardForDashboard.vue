<template>
  <v-card
    class="mx-auto"
    color="transparent"
    elevation="1"
    :to="to"
    nuxt
  >
    <v-row no-gutters>
      <v-col sm="10">
        <v-card-title>
          <div class="mx-3 text-subtitle-1 font-weight-bold">
            <slot name="title" />
          </div>
        </v-card-title>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  props: {
    to: {
      type: String,
      default: ''
    }
  }
}
</script>

<style>

</style>
