<template>
  <v-btn
    class="text-none"
    depressed
    outlined
    small
    color="grey"
    :to="to"
    nuxt
  >
    <v-icon small>
      mdi-pencil
    </v-icon>
    Edit
  </v-btn>
</template>

<script>
export default {
  props: {
    to: {
      type: String,
      require: true,
      default: ''
    }
  },
  data () {
    return {
      // jestのカバレッジレポートに反映させるために、空のdataブロックを置いています
    }
  }
}
</script>

<style>

</style>
