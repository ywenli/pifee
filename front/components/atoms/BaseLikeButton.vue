<template>
  <div>
    <v-btn
      v-if="isLiked"
      icon
      small
      :ripple="false"
      color="red lighten-2"
      class="button__like"
      @click="deleteLike()"
    >
      <v-icon>mdi-heart</v-icon>
      {{ countLike }}
    </v-btn>
    <v-btn
      v-else
      icon
      small
      :ripple="false"
      class="button__unlike"
      @click="registerLike()"
    >
      <v-icon>mdi-heart-outline</v-icon>
      {{ countLike }}
    </v-btn>
  </div>
</template>

<script>
export default {
  data () {
    return {
      likeList: []
    }
  },
  computed: {
    // いいね数を返す
    countLike () {
      return this.likeList.length
    },
    // ログインユーザーがすでにいいねしているかを判定する
    isLiked () {
      if (this.likeList.length === 0) { return false }
      return Boolean(this.findLikeId())
    }
  },
  async created () {
    // TODO: work_idでlikeのデータを取ってくる処理が registerLike()と重複しているのでまとめる
    return await this.$axios.get(`/api/v1/likes/?work_id=${this.$route.params.id}`)
      .then((res) => {
        this.likeList = res.data
      })
  },
  methods: {
    async fetchLikeByWorkId () {
      const res = await this.$axios.get(`/api/v1/likes/?work_id=${this.$route.params.id}`)
      if (res.status !== 200) { return }
      return res.data
    },
    async registerLike () {
      // this.$axios.post('/api/v1/likes', {
      //  work_id: this.$route.params.id,
      //  user_id: 1
      // })
      // this.$axios.get(`/api/v1/likes/?work_id=${this.$route.params.id}`)
      //  .then((res) => {
      //    this.likeList = res.data
      //  })
      await this.$axios.post('/api/v1/likes',
        {
          work_id: this.$route.params.id, user_id: this.$auth.user.id
        }
      )
      this.fetchLikeByWorkId()
        .then((result) => {
          this.likeList = result
        })
    },
    async deleteLike () {
      const likeId = this.findLikeId()
      const res = await this.$axios.delete(`/api/v1/likes/${likeId}`, {
        params: {
          user_id: this.$auth.user.id
        }
      })
      if (res.status !== 200) { return }
      this.likeList = this.likeList.filter(n => n.id !== likeId)
    },
    findLikeId () {
      const like = this.likeList.find((like) => {
        return (like.user_id === this.$auth.user.id)
      })
      if (like) { return like.id }
    }
  }
}
</script>

<style lang='scss'>
  .button__like::before {
    background-color: transparent !important;
  }
  .button__unlike::before {
    background-color: transparent !important;
  }
</style>
