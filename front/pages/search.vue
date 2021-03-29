<!-- eslint-disable vue/no-template-shadow -->
<template>
  <v-container>
    <v-row class="mt-2">
      <v-col>
        <!-- TODO: 検索フォームをコンポーネント化 -->
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
          @keyup.enter="search"
        />
      </v-col>
    </v-row>
    <v-row class="mb-4">
      <v-col
        v-if="results.length == 0"
        class="search__message font-weight-bold blue-grey--text text--lighten-2"
      >
        {{ message }}
      </v-col>
      <v-col
        v-for="result in results"
        v-else
        :key="result.id"
        cols="12"
        sm="4"
        lg="3"
      >
        <BaseCardForWork>
          <template #title>
            {{ result.title }}
          </template>
          <template #name>
            {{ result.name }}
          </template>
        </BaseCardForWork>
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <div class="text-h6">
          人気のカテゴリー
        </div>
      </v-col>
    </v-row>
    <TheCardsForCategory />
  </v-container>
</template>

<script>
export default {
  data () {
    return {
      searchWord: '',
      searchResults: [],
      results: [],
      message: '',
      rules: []
    }
  },
  computed: {
    // TODO: 使ってないメソッドなので削除する
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
  },
  methods: {
    search () {
      this.$axios.get('/api/v1/works/search', {
        params: {
          keyword: this.searchWord
        }
      })
        .then((res) => {
          this.results = res.data
          if (this.results.length === 0) {
            this.message = `${this.searchWord} の検索結果は見つかりませんでした`
          }
        })
    }
  }
}
</script>

<style>
.v-text-field__details {
  display: none;
}
.search__message {
  text-align: center;
}
</style>
