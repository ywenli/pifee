<template>
  <v-container>
    <v-row>
      <v-col>
        <!-- TODO: このタイトル部分のデザインを変更する -->
        <h1>
          {{ $route.params.name }}
        </h1>
      </v-col>
    </v-row>
    <v-row>
      <v-col
        v-for="work in works"
        :key="work.id"
        cols="12"
        sm="6"
        lg="4"
      >
        <BaseCardForWork
          :to='`/_username/works/${work.id}`'
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
import BaseCardForWork from '@/components/organisms/BaseCardForWork.vue'
export default {
  components: { BaseCardForWork },
  data () {
    return {
      works: [],
      title: []
    }
  },
  mounted () {
    this.$axios.get(`/api/v1/tags/${this.$route.params.name}`)
      .then((res) => {
        this.works = res.data
        this.title = [...res.data].map(value => value.title)
      })
  }
}
</script>

<style>

</style>
