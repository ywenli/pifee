const storage = window.localStorage
const keys = { exp: 'exp' }

class Authentication {
  constructor (context) {
    this.store = context.store
    this.$axios = context.$axios
  }

  // storageに有効期限を保存
  setStorage (exp) {
    storage.setItem(keys.exp, exp * 1000)
  }

  // storageを削除
  removeStorage () {
    for (const key of Object.values(keys)) {
      storage.removeItem(key)
    }
  }

  // storageの有効期限を複合して返す
  getExpire () {
    return storage.getItem(keys.exp)
  }

  // 有効期限内の場合はtrueを返す
  isAuthenticated () {
    // 現在までのunixtimeと有効期限までのunixtimeを比較
    return new Date().getTime() < this.getExpire()
  }

  // Vuexのユーザーを返す
  get user () {
    return this.store.state.current.user || {}
  }

  // ユーザーオブジェクトからユーザーidを返す
  isUserPresent () {
    return ('id' in this.user)
  }

  // 有効期限内、かつユーザーオブジェクトが存在する場合にtrueを返す
  get loggedIn () {
    return this.isAuthenticated() && this.isUserPresent()
  }

  // ログイン処理
  login ({ exp, user }) {
    this.setStorage(exp)
    this.store.dispatch('getCurrentUser', user)
  }

  // ログアウト処理
  logout () {
    this.$axios.$delete('/api/v1/user_token')
    this.removeStorage()
    this.store.dispatch('getCurrentUser', null)
  }
}

// クラス内でVuexと$axiosが扱えるようにする
export default ({ store, $axios }, inject) => {
  inject('auth', new Authentication({ store, $axios }))
}
