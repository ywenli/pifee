<template>
  <v-container>
    <v-row>
      <v-col>
        <div class="text-h4 font-weight-bold">
          Works
        </div>
      </v-col>
    </v-row>
    {{ works }}
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
                すべて
              </div>
            </v-tab>
            <v-tab>
              <div class="text-none">
                公開中
              </div>
            </v-tab>
            <v-tab>
              <div class="text-none">
                下書き
              </div>
            </v-tab>

            <v-tab-item class="my-4">
              <v-row class="mx-4">
                <v-col
                  v-for="work in works"
                  :key="work.id"
                  cols="12"
                >
                  <BaseCardForDashboard
                    :to="`/${$route.params.username}/works/${work.id}/edit`"
                    :isPublic="work.is_public"
                  >
                    <template #title>
                      {{ work.title }}
                    </template>
                  </BaseCardForDashboard>
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
import BaseCardForDashboard from '@/components/atoms/BaseCardForDashboard.vue'
export default {
  components: {
    BaseCardForDashboard
  },
  data () {
    return {
      tab: null,
      works: []
    }
  },
  created () {
    this.$axios.get(`/api/v1/works/?user_id=${this.$auth.user.id}`)
      .then((res) => {
        this.works = res.data
      })
  },
  methods: {
    deleteWork () {
      // フロントでWorkカードを削除

      // データを削除するリクエストをapiに投げる
    }
  }
}
</script>

<style>

</style>
