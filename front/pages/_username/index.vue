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
          複素数体であれば、任意のCM-タイプの A は、実際、数体である定義体（英語版）(field of definition)を持っている。自己準同型環の可能なタイプは、対合（ロサチの対合（英語版）(Rosati involution）をもつ環として既に分類さ
        </div>
      </v-col>
      <v-col cols="2">
        <BaseButtonEdit
          :to="`/${$auth.user.name}/settings`"
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
      tab: null
    }
  },
  created () {
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
