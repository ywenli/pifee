<template>
  <v-container>
    <v-row justify='start'>
      <v-col class="work__title mt-4">
        <div class="text-h4 font-weight-bold">
          {{ title }}
        </div>
      </v-col>
    </v-row>
    <v-row justify='start'>
      <v-col>
        <div class="user-id__link">
          {{ user_id }}
        </div>
        <div class="work__created-at grey--text">
          <!-- TODO: 時間表示をYY/MM/DD にする -->
          {{ created_at }}
        </div>
      </v-col>
    </v-row>
    <v-row justify='center'>
      <BaseMarkdownPreview
        v-model="body"
      />
    </v-row>
  </v-container>
</template>

<script>
import BaseMarkdownPreview from '@/components/atoms/BaseMarkdownPreview.vue'

export default {
  name: 'WorkPage',
  components: { BaseMarkdownPreview },
  data () {
    return {
      user_id: '',
      title: '',
      body: '',
      created_at: ''
    }
  },
  mounted () {
    this.$axios
      .get(`/api/v1/works/${this.$route.params.id}`)
      .then((res) => {
        this.user_id = res.data.user_id
        this.title = res.data.title
        this.body = res.data.body
        this.created_at = res.data.created_at
      })
      .catch((err) => {
        console.log(err)
        // TODO: トップページにリダイレクトする処理
      })
  }
}
</script>

<style>

</style>
