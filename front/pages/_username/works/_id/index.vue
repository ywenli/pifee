<template>
  <v-container>
    <v-row justify='start'>
      <v-col
        class="work__title mt-4"
        sm="10"
      >
        <div class="text-h4 font-weight-bold">
          {{ title }}
        </div>
      </v-col>
      <v-col sm="2">
        <BaseButtonEdit
          :to="`/${$auth.user.name}/works/${$route.params.id}/edit`"
        />
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
    <v-row>
      <v-col
        cols="11"
      >
        <BaseTagDisplay
          v-model="tags"
        />
      </v-col>
      <v-spacer />
      <v-col
        cols="1"
      >
        <BaseLikeButton />
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
import BaseButtonEdit from '@/components/atoms/BaseButtonEdit.vue'
import BaseMarkdownPreview from '@/components/atoms/BaseMarkdownPreview.vue'
import BaseTagDisplay from '@/components/atoms/BaseTagDisplay.vue'
import BaseLikeButton from '@/components/atoms/BaseLikeButton.vue'

export default {
  name: 'WorkPage',
  components: {
    BaseButtonEdit,
    BaseMarkdownPreview,
    BaseTagDisplay,
    BaseLikeButton
  },
  data () {
    return {
      user_id: '',
      title: '',
      body: '',
      created_at: '',
      tags: []
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
        this.tags = res.data.tag_list
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
