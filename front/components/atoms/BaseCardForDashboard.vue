<template>
  <v-card
    class="mx-auto"
    color="transparent"
    elevation="1"
    :to="to"
    nuxt
  >
    <v-row no-gutters>
      <v-col sm="2" align-self="center">
        <v-chip
          v-if="!isPublic"
          small
          class="ml-2"
        >
          下書き
        </v-chip>
        <v-chip
          v-else
          small
          class="ml-2"
          color="primary"
        >
          公開中
        </v-chip>
      </v-col>
      <v-col sm="10">
        <v-card-title class="pl-0">
          <div class="text-subtitle-1 font-weight-bold">
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
    },
    isPublic: {
      type: Boolean,
      default: false
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
