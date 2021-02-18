<template>
  <v-btn
    class="BaseButton"
    :color="color"
    rounded
    large
    @click="click"
    :to="to"
  >
    <slot />
  </v-btn>
</template>

<script>
export default {
  props: {
    class: {
      type: String,
      default: ''
    },
    color: {
      type: String,
      default: ''
    },
    to: {
      type: String,
      defalt: ''
    },
  },
  methods: {
    click() {
      this.$emit('click');
    }
  },
}
</script>

<style>
  .BaseButton {
    text-transform: none;
    font-weight: bold;
  }
</style>
