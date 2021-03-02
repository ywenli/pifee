// Doc: https://www.npmjs.com/package/crypto-js
const cryptoJs = require('crypto-js')
const storage = window.localStorage
const keys = { exp: 'exp' }

class Authentication {
  constructor (context) {
    this.store = context.store
    this.$axios = context.$axios
    this.error = context.error
    this.$config = context.$config
  }

  // 有効期限を暗号化
  encrypt (exp) {
    // 数字は暗号化時にエラーとなるので文字列に変換
    const expire = String(exp * 1000)
    return cryptoJs.AES.encrypt(expire, this.$config.cryptoKey).toString()
  }

  // 有効期限を複合化
  decrypt (exp) {
    try {
      const bytes = cryptoJs.AES.decrypt(exp, this.$config.cryptoKey)
      return bytes.toString(cryptoJs.enc.Utf8) || this.removeStorage()
    } catch (e) {
      return this.removeStorage()
    }
  }

  // storageに有効期限を保存
  setStorage (exp) {
    storage.setItem(keys.exp, this.encrypt(exp))
  }

  // storageを削除
  removeStorage () {
    for (const key of Object.values(keys)) {
      storage.removeItem(key)
    }
  }

  // storageの有効期限を複合して返す
  getExpire () {
    const expire = storage.getItem(keys.exp)
    return expire ? this.decrypt(expire) : null
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

  // 認証エラー処理
  unauthError () {
    this.removeStorage()
    throw this.error({ statusCode: 401, message: 'Unauthorized' })
  }
}

// クラス内でVuexと$axiosが扱えるようにする
export default ({ store, $axios, error, $config }, inject) => {
  inject('auth', new Authentication({ store, $axios, error, $config }))
}
