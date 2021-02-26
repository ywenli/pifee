<template>
  <v-container fluid>
    <v-row
      align='center'
      justify='center'
    >
      <v-col
        cols='12'
        class='my-8 text-center'
      >
        <h1 class='text-h5 font-weight-bold'>
          ログイン
        </h1>
      </v-col>
      <v-card
        flat
        width='80%'
        max-width='320'
        color='transparent'
      >
        <v-form>
          <p v-if='error' class='errors'>
            {{ error }}
          </p>
          <BaseTextField
            v-model='email'
            label='メールアドレス'
            rules='max:255|required|email'
            placeholder='your@email.com'
            prepend-icon='mdi-email'
          />
          <BaseTextField
            v-model='password'
            label='パスワード'
            rules='min:8|required'
            placeholder='8文字以上'
            prepend-icon='mdi-lock'
            :type='show ? "text" : "password"'
            :append-icon='show ? "mdi-eye" : "mdi-eye-off"'
            autocomplete='on'
            vid='password'
            @click:append='show = !show'
          />
        </v-form>
        <v-row justify='end'>
          <nuxt-link
            to="/password/reset"
            class="my-0 cbody-2 text-decoration-none"
          >
            パスワードを忘れた
          </nuxt-link>
        </v-row>
        <v-card-text class="my-5">
          <v-row justify='center'>
            <BaseButton
              color='primary'
              :loading='loading'
              @click="login"
            >
              ログイン
            </BaseButton>
          </v-row>
        </v-card-text>
        <v-card-actions
          class='my-4'
        >
          <v-container>
            <v-row justify='center'>
              アカウントをお持ちでないですか？
            </v-row>
            <v-row justify='center' class="my-4">
              <nuxt-link
                to='/signup'
                class='text-decoration-none'
              >
                アカウント作成
              </nuxt-link>
            </v-row>
          </v-container>
        </v-card-actions>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import BaseTextField from '../components/atoms/BaseTextField.vue'
import BaseButton from '../components/atoms/BaseButton.vue'
export default {
  components: {
    BaseTextField,
    BaseButton
  },
  data () {
    return {
      email: '',
      password: '',
      error: '',
      show: false,
      loading: false
    }
  },
  methods: {
    async login () {
      this.loading = true
      const params = { auth: { email: this.email, password: this.password } }
      await this.$axios.$post('/api/v1/user_token', params)
        .then(response => this.authSuccessful(response))
        .catch(error => this.authFailure(error))
      this.loading = false
    },
    authSuccessful (response) {
      console.log(response)
    },
    authFailure ({ response }) {
      console.log(response)
    }
  }

}
</script>

<style>

</style>
