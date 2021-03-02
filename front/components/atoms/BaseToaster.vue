<template>
  <v-snackbar
    v-model="setSnackbar"
    top
    right
    text
    :timeout='toast.timeout'
    :color='toast.color'
  >
    {{ toast.msg }}
    <template #action='{ attrs }'>
      <v-btn
        v-bind="attrs"
        icon
        small
        plain
        @click="resetToast"
      >
        <v-icon
          color="toast.color"
        >
          mdi-close-circle-outline
        </v-icon>
      </v-btn>
    </template>
  </v-snackbar>
</template>

<script>
export default {
  computed: {
    toast () {
      return this.$store.state.toast
    },
    setSnackbar: {
      get () {
        return !!this.toast.msg
      },
      set (val) {
        this.resetToast()
        return val
      }
    }
  },
  beforeDestroy () {
    // ページ遷移前にトースターを削除する
    this.resetToast()
  },
  methods: {
    resetToast () {
      return this.$store.dispatch('getToast', { msg: null })
    }
  }
}
</script>

<style>

</style>
