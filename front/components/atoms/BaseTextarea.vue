<template>
  <ValidationProvider
    v-slot='{ errors }'
    :name='$attrs.label'
    :rules='rules'
    :vid='$attrs.label'
  >
    <v-textarea
      v-model='inputValue'
      class='textarea'
      filled
      rows="4"
      no-resize
      color="primary"
      :error-messages='errors'

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

<style scoped>
.textarea input {
  color: primary !important;
}
</style>
