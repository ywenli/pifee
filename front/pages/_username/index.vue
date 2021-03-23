<template>
  <v-container class="px-4">
    <v-row class="my-4 px-4">
      <v-col cols="2">
        <v-img src="http://placekitten.com/200/200" width="120" />
      </v-col>
      <v-col cols="8" align-self="start">
        <div class="text-h5 font-weight-medium">
          {{ $route.params.username }}
        </div>
        <div class="my-4 text-body-2">
          {{ user.profile }}
        </div>
      </v-col>
      <v-col cols="2">
        <BaseButtonEdit
          :to="`/${$auth.user.url}/settings`"
        />
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-card
          flat
        >
          <v-tabs
            v-model="tab"
            slider-color="primary"
          >
            <v-tabs-slider color="primary" />
            <v-tab>
              <div class="text-none">
                Works
              </div>
            </v-tab>

            <v-tab-item class="my-4">
              <v-row class="mx-4">
                <v-col
                  v-for="work in works"
                  :key="work.id"
                  cols="12"
                  sm="4"
                  lg="3"
                >
                  <BaseCardForWork
                    :to="`/${work.url}/works/${work.id}`"
                  >
                    <template #title>
                      {{ work.title }}
                    </template>
                    <template #name>
                      {{ work.name }}
                    </template>
                  </BaseCardForWork>
                </v-col>
              </v-row>
            </v-tab-item>
          </v-tabs>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import BaseButtonEdit from '@/components/atoms/BaseButtonEdit.vue'
import BaseCardForWork from '@/components/organisms/BaseCardForWork.vue'
export default {
  components: {
    BaseButtonEdit,
    BaseCardForWork
  },
  data () {
    return {
      works: [],
      tab: null,
      user: []
    }
  },
  created () {
    this.$axios.get('/api/v1/works', {
      params: {
        user_id: this.$auth.user.id
      }
    })
      .then((res) => { this.works = res.data })
    this.$axios.get(`/api/v1/users/${this.$route.params.username}`)
      .then((res) => {
        this.user = res.data
      })
  }
}
</script>

<style>

</style>
