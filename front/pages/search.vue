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
    <table
      v-if="searchResults !== null"
    >
      <tr v-for="filteredResults in filter" :key="filteredResults.id">
        <td v-text="filteredResults.title" />
        <td v-text="filteredResults.body" />
      </tr>
    </table>
    <div v-else>
      {{ searchWord }}の検索結果はありません
    </div>
  </v-container>
</template>

<script>
export default {
  data () {
    return {
      searchWord: '',
      searchResults: []
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
  }
}
</script>

<style>

</style>
