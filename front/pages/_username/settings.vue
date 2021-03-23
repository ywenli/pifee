<template>
  <v-container fluid>
    <BaseToaster />
    <v-row justify='center'>
      <v-col cols="2">
        <v-img src="http://placekitten.com/200/200" width="120" />
      </v-col>
    </v-row>
    <v-row justify='center'>
      <v-btn
        class="text-none grey--text"
        small
        text
        color="transparent"
        :ripple="false"
        rounded
        @click="changeAvatar"
      >
        <v-icon small class="mx-1">
          mdi-cached
        </v-icon>
        Change
      </v-btn>
    </v-row>
    <v-row
      align='center'
      justify='center'
    >
      <v-card
        flat
        width='80%'
        max-width='320'
        color='transparent'
      >
        <v-form
          ref='form'
        >
          <p v-if='error' class='errors'>
            {{ error }}
          </p>
          <BaseTextField
            v-model='currentUser.name'
            label='ユーザー名'
            rules='max:20|required'
            placeholder='半角英数字'
            prepend-icon='mdi-account'
            counter='20'
            maxlength='20'
          />
          <BaseTextarea
            v-model="currentUser.profile"
            label='プロフィール'
          />
        </v-form>
        <v-card-text class='px-0'>
          <v-row justify='center'>
            <BaseButton
              color='primary'
              @click='updateProfile'
            >
              更新する
            </BaseButton>
          </v-row>
        </v-card-text>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import BaseTextField from '@/components/atoms/BaseTextField.vue'
import BaseButton from '@/components/atoms/BaseButton.vue'
import BaseTextarea from '@/components/atoms/BaseTextarea.vue'
import BaseToaster from '@/components/atoms/BaseToaster.vue'
export default {
  components: {
    BaseTextField,
    BaseButton,
    BaseTextarea
  },
  data () {
    return {
      error: '',
      currentUser: [],
      currentUserUpdated: []
    }
  },
  mounted () {
    this.$axios.get('/api/v1/users/current_user')
      .then((res) => {
        this.currentUser = res.data
      })
  },
  methods: {
    updateProfile () {
      this.$axios.patch(`/api/v1/users/${this.currentUser.id}`, {
        name: this.currentUser.name,
        profile: this.currentUser.profile
      })
        .then(() => {
          this.$store.dispatch('getToast', {
            msg: 'プロフィールを更新しました',
            color: 'success'
          })
        })
    },
    changeAvatar () {
      // アバターを変更する処理
    }
  }

}
</script>
