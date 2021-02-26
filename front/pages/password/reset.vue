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
          パスワード再設定
        </h1>
      </v-col>
      <v-card
        flat
        width='80%'
        max-width='320'
        color='transparent'
      >
        <v-card-text>
          ユーザー名とメールアドレスを入力してください。
          新しいパスワードを再設定するためのリンクをお送りします。
        </v-card-text>
        <v-form>
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
        </v-form>
        <v-card-text class="px-0">
          <v-row justify='center'>
            <BaseButton
              color='primary'
              :disabled="!isValid || loading"
              :loading='loading'
              @click="sendPasswordReset"
            >
              パスワード再設定リンクを送信
            </BaseButton>
          </v-row>
        </v-card-text>
        <v-card-actions
          class='my-4'
        >
          <v-container>
            <v-row justify='center'>
              または
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
import BaseTextField from '@/components/atoms/BaseTextField.vue'
import BaseButton from '@/components/atoms/BaseButton.vue'
export default {
  components: {
    BaseTextField,
    BaseButton
  },
  data () {
    return {
      name: '',
      email: '',
      error: '',
      show: false,
      loading: false
    }
  },
  methods: {
  }

}
</script>

<style>

</style>
