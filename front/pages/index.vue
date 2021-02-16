<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      <div>
        <button
          type="button"
          name="button"
          @click="getMsg"
        >
          RailsからAPIを取得する
        </button>
        <div
          v-for="(msg, i) in msgs"
          :key="i"
        >
          {{ msg }}
        </div>
      </div>
      <div class="text-center">
        <logo />
      </div>
    </v-col>
  </v-row>
</template>

<script>
import Logo from '~/components/Logo.vue'
import VuetifyLogo from '~/components/VuetifyLogo.vue'

export default {
  components: {
    Logo,
    VuetifyLogo
  },
  data() {
    return {
      msgs: []
    }
  },
  methods: {
    getMsg () {
      this.$axios.$get('/api/v1/test')
        .then(res => this.msgs.push(res))
    }
  }
}
</script>
