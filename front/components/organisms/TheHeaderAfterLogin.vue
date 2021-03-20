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
    <v-btn
      icon
      to="/search"
      nuxt
      v-on='on'
    >
      <v-icon>
        mdi-magnify
      </v-icon>
    </v-btn>
    <BaseButton
      color='primary'
      :to='`/${$auth.user.name}/works/new`'
      small
      nuxt
    >
      New work
    </BaseButton>
    <v-menu
      app
      offset-x
      offset-y
      max-width='200'
    >
      <template #activator='{ on, attrs }'>
        <v-btn
          icon
          v-bind='attrs'
          v-on='on'
        >
          <v-icon>
            mdi-account-circle
          </v-icon>
        </v-btn>
      </template>

      <v-list
        dense
        class="py-0"
      >
        <v-list-item-group color='primary'>
          <v-list-item>
            <v-list-item-title>
              <v-icon>mdi-account</v-icon>
              <v-btn
                :to="`/${$auth.user.name}`"
                class='text-none text-decoration-none pl-0'
                depressed
                text
                plain
                nuxt
                :ripple="false"
              >
                {{ $auth.user.name }}
              </v-btn>
              <!-- 下のコードだとリンクが正常に遷移するときとしない時があるため、上のコードに変更
              <nuxt-link
                :to='`/${$auth.user.name}`'
                class='text-decoration-none black--text'
              >
                {{ $auth.user.name }}
              </nuxt-link>
              -->
            </v-list-item-title>
          </v-list-item>

          <v-divider />

          <v-list-item>
            <v-list-item-title>
              <v-icon>mdi-file-edit-outline</v-icon>
              <nuxt-link
                :to="`/${$auth.user.name}/works`"
                class='text-decoration-none black--text pl-1'
              >
                作品の管理
              </nuxt-link>
            </v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title>
              <v-icon>mdi-cog</v-icon>
              <nuxt-link
                :to="`/${$auth.user.name}/settings`"
                class='text-decoration-none black--text pl-1'
              >
                アカウント設定
              </nuxt-link>
            </v-list-item-title>
          </v-list-item>

          <v-divider />

          <v-list-item>
            <v-list-item-title>
              <v-icon>mdi-logout-variant</v-icon>
              <nuxt-link
                to='/logout'
                class='text-decoration-none black--text pl-1'
              >
                ログアウト
              </nuxt-link>
            </v-list-item-title>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script>
import BaseButton from '../atoms/BaseButton.vue'
export default {
  components: { BaseButton },
  data ({ $config: { appName } }) {
    return {
      appName,
      menus: []
    }
  }
}
</script>

<style>

</style>
