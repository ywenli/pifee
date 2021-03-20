<template>
  <v-container>
    <v-row>
      <v-col>
        <div class="text-h4 font-weight-bold">
          Works
        </div>
      </v-col>
    </v-row>
    {{ workPublic }}
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
              <div class="text-none" @click="filterWorkPublic">
                公開中
              </div>
            </v-tab>
            <v-tab>
              <div class="text-none" @click="filterWorkPrivate">
                下書き
              </div>
            </v-tab>

            <v-tab-item

              class="my-4"
            >
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
            <v-tab-item class="my-4">
              <v-row class="mx-4">
                <v-col
                  v-for="workPublic in worksPublic"
                  :key="workPublic.id"
                  cols="12"
                >
                  <BaseCardForDashboard
                    :to="`/${$route.params.username}/works/${workPublic.id}/edit`"
                    :isPublic="workPublic.is_public"
                  >
                    <template #title>
                      {{ workPublic.title }}
                    </template>
                  </BaseCardForDashboard>
                </v-col>
              </v-row>
            </v-tab-item>
            <v-tab-item

              class="my-4"
            >
              <v-row class="mx-4">
                <v-col
                  v-for="workPrivate in worksPrivate"
                  :key="workPrivate.id"
                  cols="12"
                >
                  <BaseCardForDashboard
                    :to="`/${$route.params.username}/works/${workPrivate.id}/edit`"
                    :isPublic="workPrivate.is_public"
                  >
                    <template #title>
                      {{ workPrivate.title }}
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
      works: [],
      worksPublic: [],
      worksPrivate: []
    }
  },
  mounted () {
    this.$axios.get(`/api/v1/works/?user_id=${this.$auth.user.id}`)
      .then((res) => {
        this.works = res.data
      })
  },
  methods: {
    filterWorkPublic () {
      this.worksPublic = this.works.filter(work => work.is_public === true)
    },
    filterWorkPrivate () {
      this.worksPrivate = this.works.filter(work => work.is_public === false)
    }
  }
}
</script>

<style>

</style>
