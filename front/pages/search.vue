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
      v-if="searchResultAll !== null"
    >
      <tr v-for="searchResultAll in filteredResults" :key="searchResultAll.id">
        <td v-text="searchResultAll.title" />
        <td v-text="searchResultAll.body" />
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
      searchResultAll: []
    }
  },
  computed: {
    filteredResults () {
      const searchResultAll = []
      for (const i in this.searchResultAll) {
        const searchResult = this.searchResultAll[i]
        if (searchResult.title.includes(this.searchWord)) {
          searchResultAll.push(searchResult)
        }
      }
      return searchResultAll
    }
  },
  mounted () {
    this.$axios.get('/api/v1/works')
      .then((res) => {
        this.searchResultAll = res.data
      })
  }
}
</script>

<style>

</style>
