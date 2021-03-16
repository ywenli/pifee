<template>
  <v-container>
    <v-form>
      <ValidationObserver ref="obs" v-slot="ObserverProps">
        <div class="work__create--box">
          <v-row dense>
            <v-col>
              <BaseTextField
                v-model="title"
                label="タイトル"
                rules="max:80|required"
              />
            </v-col>
          </v-row>
          <v-row dense>
            <v-col>
              <BaseTagInput
                v-model="tag_list"
              />
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <BaseMarkdown
                v-model="body"
              />
            </v-col>
          </v-row>
        </div>
      </ValidationObserver>
    </v-form>
    <v-row justify='center'>
      <v-spacer />
      <div class="my-auto mx-3">
        <v-switch
          v-model="isPublic"
          :label="isPublic ? msgPublic : msgPrivate"
          inset
        />
      </div>
      <div class="my-auto mx-3">
        <BaseButton
          class="work__button"
          color="primary"
          @click="createWork"
        >
          保存
        </BaseButton>
      </div>
    </v-row>
  </v-container>
</template>

<script>
import BaseTextField from '@/components/atoms/BaseTextField.vue'
import BaseMarkdown from '@/components/atoms/BaseMarkdown.vue'
import BaseButton from '@/components/atoms/BaseButton.vue'
import BaseTagInput from '@/components/atoms/BaseTagInput.vue'
export default {
  components: {
    BaseTextField,
    BaseMarkdown,
    BaseButton,
    BaseTagInput
  },
  data () {
    return {
      title: '',
      body: '',
      isPublic: false,
      msgPublic: '公開する',
      msgPrivate: '下書き',
      tag_list: []
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.current.user
    }
  },
  methods: {
    createWork () {
      this.$axios
        .post('/api/v1/works', {
          title: this.title,
          body: this.body,
          is_public: this.isPublic,
          user_id: this.currentUser.id,
          tag_list: this.tag_list
        })
        .then((res) => {
          this.$router.push(`/_username/works/${res.data.id}`)
        })
    }
  }

}
</script>

<style>

</style>
