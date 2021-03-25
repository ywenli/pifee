<template>
  <v-container>
    <v-row class="">
      <v-col cols="3" sm="2" lg="1">
        <v-avatar tile size="63" max-width="82">
          <img :src="language.src" :alt="`${language.name} logo image`">
        </v-avatar>
      </v-col>
      <v-col cols="9" sm="10" lg="11" align-self="center">
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
          :to='`/${work.url}/works/${work.id}`'
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
  </v-container>
</template>

<script>
import BaseCardForWork from '@/components/organisms/BaseCardForWork.vue'
export default {
  components: { BaseCardForWork },
  data () {
    return {
      works: [],
      title: [],
      languages: [
        { name: 'JavaScript', src: require('~/assets/image/svg/javascript.svg?inline') },
        { name: 'TypeScript', src: require('@/assets/image/svg/typescript-icon.svg?inline') },
        { name: 'React', src: require('@/assets/image/svg/react.svg?inline') },
        { name: 'Vue', src: require('@/assets/image/svg/vue.svg?inline') },
        { name: 'Next', src: require('@/assets/image/svg/nextjs-icon.svg?inline') },
        { name: 'Nuxt', src: require('@/assets/image/svg/nuxt-icon.svg?inline') },
        { name: 'Python', src: require('@/assets/image/svg/python.svg?inline') },
        { name: 'Go', src: require('@/assets/image/svg/go.svg?inline') },
        { name: 'Rails', src: require('@/assets/image/svg/rails.svg?inline') },
        { name: 'Ruby', src: require('@/assets/image/svg/ruby.svg?inline') },
        { name: 'PHP', src: require('@/assets/image/svg/php.svg?inline') },
        { name: 'AWS', src: require('@/assets/image/svg/aws.svg?inline') },
        { name: 'Azure', src: require('@/assets/image/svg/azure.svg?inline') },
        { name: 'Vuetify', src: require('@/assets/image/svg/vuetifyjs.svg?inline') },
        { name: 'CSS', src: require('@/assets/image/svg/css-3.svg?inline') },
        { name: 'HTML5', src: require('@/assets/image/svg/html-5.svg?inline') },
        { name: 'Laravel', src: require('@/assets/image/svg/laravel.svg?inline') },
        { name: 'Firevase', src: require('@/assets/image/svg/firebase.svg?inline') },
        { name: 'Flutter', src: require('@/assets/image/svg/flutter.svg?inline') },
        { name: 'Android', src: require('@/assets/image/svg/android-icon.svg?inline') }
      ],
      language: []
    }
  },
  mounted () {
    this.$axios.get(`/api/v1/tags/${this.$route.params.name}`)
      .then((res) => {
        this.works = res.data
        // TODO: 以下のコードはもう使われてないので消す
        this.title = [...res.data].map(value => value.title)
      })
    const language = this.languages.filter(e => e.name === this.$route.params.name)
    if (language.length > 0) {
      this.language = language[0]
    } else {
      // TODO: データが存在しない時の処理
      console.log('データはありません')
    }
  }
}
</script>

<style>

</style>
