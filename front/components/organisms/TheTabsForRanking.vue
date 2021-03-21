<template>
  <v-card
    flat
  >
    <v-tabs
      v-model="tab"
      align-with-title
    >
      <v-tabs-slider />

      <v-tab
        v-for="(item, index) in items"
        :key="index"
      >
        <div class="text-none">
          {{ item }}
        </div>
      </v-tab>
    </v-tabs>

    <v-tabs-items v-model="tab">
      <!-- daily: 1日のランキング -->
      <v-tab-item>
        <v-container>
          <v-row>
            <v-col
              v-for="work in ranking_daily"
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
      </v-tab-item>

      <!-- weekly: 週間ランキング -->
      <v-tab-item>
        <v-container>
          <v-row>
            <v-col
              v-for="work in ranking_weekly"
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
      </v-tab-item>

      <!-- all: 全期間のランキング -->
      <v-tab-item>
        <v-container>
          <v-row>
            <v-col
              v-for="work in ranking_all"
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
      </v-tab-item>
    </v-tabs-items>
  </v-card>
</template>

<script>
import BaseCardForWork from '@/components/organisms/BaseCardForWork.vue'
export default {
  components: { BaseCardForWork },
  data () {
    return {
      tab: null,
      items: [
        'Daily', 'Weekly', 'All'
      ],
      ranking_daily: [],
      ranking_weekly: [],
      ranking_all: []
    }
  },
  mounted () {
    this.$axios.get('/api/v1/likes/daily_ranking')
      .then((res) => { this.ranking_daily = res.data })
    this.$axios.get('/api/v1/likes/weekly_ranking')
      .then((res) => { this.ranking_weekly = res.data })
    this.$axios.get('/api/v1/likes/all_ranking')
      .then((res) => { this.ranking_all = res.data })
  },
  methods: {

  }
}
</script>

<style>

</style>
