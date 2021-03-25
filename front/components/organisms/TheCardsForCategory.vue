<template>
  <v-row>
    <v-col
      v-for="(language, index) in languages"
      :key="index"
      cols="4"
      sm="3"
      lg="2"
    >
      <BaseCardForCategory
        v-model="languages"
        :to='`/category/${language.name}`'
        :src='language.src'
      >
        {{ language.name }}
      </BaseCardForCategory>
    </v-col>
  </v-row>
</template>

<script>
import BaseCardForCategory from '@/components/organisms/BaseCardForCategory.vue'
export default {
  components: {
    BaseCardForCategory
  },
  data () {
    return {
      languages: [
        { name: 'JavaScript', src: require('@/assets/image/svg/javascript.svg?inline') },
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
      ]
    }
  }
}
</script>

<style>

</style>
