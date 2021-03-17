<template>
  <v-container>
    <v-row>
      <v-col>
        アイコン
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <div class="text-h5">
          {{ $route.params.username }}
        </div>
      </v-col>
    </v-row>
    <v-row class="mx-4">
      <v-col
        v-for="work in works"
        :key="work.id"
        cols="12"
        sm="4"
        lg="3"
      >
        <BaseCardForWork
          :to="`/${work.user_id}/works/${work.id}`"
        >
          <template #title>
            {{ work.title }}
          </template>
          <template #user_id>
            {{ work.user_id }}
          </template>
        </BaseCardForWork>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import BaseCardForWork from '../../components/organisms/BaseCardForWork.vue'
export default {
  components: { BaseCardForWork },
  data () {
    return {
      works: []
    }
  },
  mounted () {
    this.$axios.get('/api/v1/works', {
      params: {
        user_id: this.$auth.user.id
      }
    })
      .then((res) => { this.works = res.data })
  }
}
</script>

<style>

</style>
