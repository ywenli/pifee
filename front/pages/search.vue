<!-- eslint-disable vue/no-template-shadow -->
<template>
  <v-container>
    <v-row class="my-2">
      <v-col>
        <v-text-field
          v-model="searchWord"
          app
          label="キーワードを入力..."
          single-line
          rounded
          outlined
          autofocus
          clearable
          prepend-inner-icon="mdi-magnify"
        />
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        人気のカテゴリー
      </v-col>
    </v-row>
    <v-row>
      <v-col
        v-for="tag in tags"
        :key="tag"
        cols="4"
        sm="3"
        lg="2"
      >
        <BaseCardForCategory
          v-model="tags"
          :to='`/category/${tag}`'
        >
          {{ tag }}
        </BaseCardForCategory>
      </v-col>
    </v-row>
    <v-row dense>
      <v-col
        v-for="filteredResults in filter"
        :key="filteredResults.id"
        cols="12"
        sm="6"
        lg="4"
      >
        <v-card
          flat
          :to='`/account/works/${filteredResults.id}`'
        >
          <div class="d-flex flex-no-wrap justify-space-between">
            <div>
              <v-card-title
                class="headline"
                v-text="filteredResults.title"
              />
              <!-- TODO: ユーザー名とアイコンを表示する -->
              <v-card-subtitle v-text="filteredResults.user_id" />
            </div>

            <v-avatar
              class="ma-3"
              size="125"
              tile
            >
              <!-- TODO: workの画像を取得する -->
              <v-img :src='"https://cdn.vuetifyjs.com/images/cards/foster.jpg"' />
            </v-avatar>
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import BaseCardForCategory from '@/components/organisms/BaseCardForCategory.vue'
export default {
  components: { BaseCardForCategory },
  data () {
    return {
      searchWord: '',
      searchResults: [],
      tags: []
    }
  },
  computed: {
    filter () {
      const filteredResults = []
      for (const i in this.searchResults) {
        const searchResult = this.searchResults[i]
        if (searchResult.title.includes(this.searchWord)) {
          filteredResults.push(searchResult)
        }
      }
      return filteredResults
    }
  },
  mounted () {
    this.$axios.get('/api/v1/works')
      .then((res) => {
        this.searchResults = res.data
      })
    this.$axios.get('/api/v1/tags')
      .then((res) => {
        this.tags = [...res.data].map(value => value.name)
      })
  }
}
</script>

<style>

</style>
