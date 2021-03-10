<template>
  <v-combobox
    v-model="inputValue"
    label="タグ"
    append-icon
    chips
    class="tag-input"
    hide-selected
    multiple
    max-width="auto"
    readonly
    solo
    flat
  />
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
