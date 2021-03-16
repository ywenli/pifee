<template>
  <v-container>
    <v-row>
      <v-col>
        <div class="text-h4">
          Popular
        </div>
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <TheTabsForRanking />
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <div class="text-h4">
          Category
        </div>
      </v-col>
    </v-row>
    <v-row>
      <!-- TODO: organismsコンポーネントにまとめる -->
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
  </v-container>
</template>

<script>
import TheTabsForRanking from '@/components/organisms/TheTabsForRanking.vue'
import BaseCardForCategory from '@/components/organisms/BaseCardForCategory.vue'

export default {
  components: {
    TheTabsForRanking,
    BaseCardForCategory
  },
  layout ({ $auth }) {
    return $auth.loggedIn ? 'default' : 'welcome'
  },
  data () {
    return {
      tags: []
    }
  },
  mounted () {
    this.$axios.get('/api/v1/tags')
      .then((res) => {
        this.tags = [...res.data].map(value => value.name)
      })
  }
}
</script>

<style>

</style>
