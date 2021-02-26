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
          新規登録
        </h1>
      </v-col>
      <v-card
        flat
        width='80%'
        max-width='320'
        color='transparent'
      >
        <v-form
          ref='form'
          v-model='isValid'
        >
          <p v-if='error' class='errors'>
            {{ error }}
          </p>
          <BaseTextField
            v-model='name'
            label='ユーザー名'
            rules='max:20|required'
            placeholder='半角英数字'
            prepend-icon='mdi-account'
            counter='20'
            maxlength='20'
          />
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
        <v-card-text class='px-0'>
          <v-row justify='center'>
            <BaseButton
              color='primary'
              :disabled='!isValid || loading'
              :loading='loading'
              @click='signup'
            >
              登録する
            </BaseButton>
          </v-row>
        </v-card-text>
        <v-card-actions
          class='my-4'
        >
          <v-container>
            <v-row justify='center'>
              アカウントをお持ちですか？
            </v-row>
            <v-row justify='center' class="my-4">
              <nuxt-link
                to='/login'
                class='text-decoration-none'
              >
                ログインする
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
      name: '',
      email: '',
      password: '',
      error: '',
      show: false,
      loading: false,
      isValid: false
    }
  },
  methods: {
    signup () {
      this.loading = true
      setTimeout(() => {
        this.formReset()
        this.loading = false
      }, 1500)
    },
    formReset () {
      this.$refs.form.reset()
      this.name = ''
      this.email = ''
      this.password = ''
      this.error = ''
    }
  }

}
</script>

<style>

</style>
