<template>
  <ValidationProvider
    v-slot='{ errors, valid }'
    :name='$attrs.label'
    :rules='rules'
    :vid='$attrs.label'
  >
    <v-text-field
      v-model='inputValue'
      :error-messages='errors'
      :success='valid'
      v-bind='$attrs'
      v-on='$listeners'
    />
  </ValidationProvider>
</template>

<script>
export default {
  props: {
    rules: {
      type: [Object, String],
      default: ''
    },
    value: {
      type: null,
      required: false,
      default: ''
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
