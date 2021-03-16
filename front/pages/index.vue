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
      <TheTabsForRanking />
    </v-row>
  </v-container>
</template>

<script>
import TheTabsForRanking from '../components/organisms/TheTabsForRanking.vue'

export default {
  components: { TheTabsForRanking },
  layout ({ $auth }) {
    return $auth.loggedIn ? 'default' : 'welcome'
  }
}
</script>

<style>

</style>
