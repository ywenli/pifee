// 開発環境時のみaxiosのconsoleログを出力
// isDev: 開発環境の場合にtrueを返す
export default ({ $axios, isDev }) => {
  // リクエストログ
  $axios.onRequest((config) => {
    if (isDev) { console.log(config) }
  })
  // レスポンスログ
  $axios.onResponse((config) => {
    if (isDev) { console.log(config) }
  })
  // エラーログ
  $axios.onError((e) => {
    console.log(e.response)
  })
}
