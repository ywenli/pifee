<template>
  <div>
    <v-chip
      v-for="tag in value"
      :key="tag"
      class="mr-1"
    >
      {{ tag }}
    </v-chip>
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: Array,
      default: () => []
    }
  },
  computed: {
    inputValue: {
      get () {
        return this.value
      },
      set (value) {
        this.$emit('input', value)
      }
    }
  }
}
</script>

<style>

</style>
