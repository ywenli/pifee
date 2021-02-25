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
        <v-card-title primary-title>
          <slot name='form-card-content' />
        </v-card-title>
        <v-form>
          <p v-if='error' class='errors'>
            {{ error }}
          </p>
          <BaseTextField
            v-model='name'
            label='名前'
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
        <v-row justify='center'>
          <BaseButton
            color='primary'
            @click="signup"
          >
            登録する
          </BaseButton>
        </v-row>
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
      show: 'false'
    }
  },
  methods: {
    signup () {

    }
  }

}
</script>

<style>

</style>
