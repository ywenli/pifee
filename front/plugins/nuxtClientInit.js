// client初期設定ファイル
export default async ({ $auth, $axios, store }) => {
  if ($auth.isAuthenticated()) {
    await $axios.$get('/api/v1/users/current_user')
      .then(tokenUser => store.dispatch('getCurrentUser', tokenUser))
      // トークンが不正な場合などユーザーが取得できない場合の処理
      // Cookieはサーバーで削除済みなのでここでは記述しない
      .catch(() => $auth.removeStorage())
  }
}
