<template>
  <v-btn
    class="BaseButton"
    :color="color"
    rounded
    :to="to"
    @click="click"
  >
    <slot />
  </v-btn>
</template>

<script>
export default {
  props: {
    color: {
      type: String,
      default: ''
    },
    to: {
      type: String,
      required: false,
      default: ''
    }
  },
  methods: {
    click () {
      this.$emit('click')
    }
  }
}
</script>

<style>
  .BaseButton {
    text-transform: none;
    font-weight: bold;
  }
</style>
