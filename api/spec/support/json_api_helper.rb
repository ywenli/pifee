module JsonApiHelpers
  def active_user
    User.find_by(activated: true)
  end

  def api_url(path = '/')
    "#{ENV['BASE_URL']}/api/v1/#{path}"
  end

  # コントローラーのJSONレスポンスを受け取る
  # @return [Srting] JSONレスポンス
  def response_body
    JSON.parse(@response.body)
  end

    # テスト用Cookie（Rack::Test::CookieJar Class）にトークンを保存する
  def logged_in(user)
    cookies[UserAuth.token_access_key] = user.to_token
  end
end
