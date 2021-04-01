<template>
  <v-container>
    <v-row>
      <v-col>
        <div class="text-h4 font-weight-bold">
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
        <div class="text-h4 font-weight-bold">
          Category
        </div>
      </v-col>
    </v-row>
    <TheCardsForCategory />
  </v-container>
</template>

<script>
import TheTabsForRanking from '@/components/organisms/TheTabsForRanking.vue'
import TheCardsForCategory from '@/components/organisms/TheCardsForCategory.vue'
export default {
  components: {
    TheTabsForRanking,
    TheCardsForCategory
  },
  layout ({ $auth }) {
    return $auth.loggedIn ? 'default' : 'welcome'
  }
}
</script>

<style>

</style>
