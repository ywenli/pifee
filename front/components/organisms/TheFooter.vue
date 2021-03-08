<template>
  <v-footer
    class='footer'
    color='primary lighten-1'
    app
    dense
    padless
    absolute
    elevation='1'
  >
    <v-row
      justify='center'
      no-gutters
    >
      <v-btn
        v-for='link in links'
        :key='link'
        class='my-3 custom-transform-class text-none'
        :to='link.url'
        color='white'
        text
        rounded
      >
        {{ link.name }}
      </v-btn>
      <v-divider
        vertical
        inset
        mx-2
      />
      <v-btn
        href='https://github.com/ywenli/pifee/issues/new'
        target="_blank"
        class='footer_btn--github my-3 custom-transform-class text-none text-decoration-none'
        color='white'
        text
        rounded
      >
        Any bugs?
        <v-icon right>
          mdi-open-in-new
        </v-icon>
      </v-btn>
      <v-col
        class='py-4 text-center white--text'
        cols='12'
      >
        {{ new Date().getFullYear() }} — ywenli
      </v-col>
    </v-row>
  </v-footer>
</template>

<script>
export default {
  data: () => ({
    links: [
      { name: 'Home', url: '/' },
      { name: 'About pifee', url: '/about' },
      { name: 'Contact', url: '/contact' }
    ]
  })
}
</script>

<style>
.footer__btn--github {
  text-transform: none !important;
}
</style>
