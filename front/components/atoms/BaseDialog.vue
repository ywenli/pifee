<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="500"
    >
      <template #activator="{ on, attrs }">
        <v-btn
          v-bind="attrs"
          small
          fab
          elevation="1"
          rounded
          v-on="on"
          @click="dialogOpen"
        >
          <v-icon color="grey">
            mdi-trash-can-outline
          </v-icon>
        </v-btn>
      </template>

      <v-card>
        <v-card-title class="text-h6">
          削除しますか？
        </v-card-title>

        <v-card-text>
          Workを削除しようとしています。
          1度削除するとデータを復元することはできません。
        </v-card-text>

        <v-divider />

        <v-card-actions>
          <v-spacer />
          <v-btn
            ref="cancel"
            color="blue"
            text
            @click="dialog = false"
          >
            キャンセル
          </v-btn>
          <v-btn
            color="red"
            text
            @click="deleteWork"
          >
            削除する
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  data () {
    return {
      dialog: false
    }
  },
  methods: {
    dialogOpen () {
      // キャンセルボタンにフォーカスする
      setTimeout(() => {
        this.$refs.cancel.$el.focus()
      })
    },
    deleteWork () {
      this.$axios.delete(`/api/v1/works/${this.$route.params.id}`)
        .then(
          setTimeout(() => {
            this.$router.push(`/${this.$auth.user.url}/works`)
          }, 1000)
        )
    }
  }
}
</script>

<style>

</style>
