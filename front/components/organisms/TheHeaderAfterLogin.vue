<template>
  <v-app-bar
    app
    elevation="1"
    color='white'
  >
    <v-appbar-title>
      <nuxt-link
        to="/"
        class="app-title-link"
        style="color:black;"
      >
        {{ appName }}
      </nuxt-link>
    </v-appbar-title>
    <v-spacer />

    <v-menu
      app
      offset-x
      offset-y
      max-width='200'
    >
      <template #activator='{ on }'>
        <v-btn
          icon
          v-on='on'
        >
          <v-icon>
            mdi-account-circle
          </v-icon>
        </v-btn>
      </template>
      <v-list dense>
        <v-subheader>
          ログイン中のユーザー
        </v-subheader>

        <v-list-item>
          <v-list-item-content>
            <v-list-item-subtitle>
              {{ $auth.user.name }}
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>

        <v-divider />

        <v-subheader>
          アカウント
        </v-subheader>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>
              アカウント設定
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-divider />

        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>
              <nuxt-link
                to='logout'
                class='link__logout'
              >
                ログアウト
              </nuxt-link>
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script>
import BaseButton from '../atoms/BaseButton.vue'
export default {
  components: { },
  data ({ $config: { appName } }) {
    return {
      appName,
      menus: []
    }
  }
}
</script>

<style>
.app-title-link {
  text-decoration: none;
}
.link__logout {
  text-decoration: none;
}
</style>
