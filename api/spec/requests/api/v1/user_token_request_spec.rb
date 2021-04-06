require 'rails_helper'

RSpec.describe 'Api::V1::UserTokens', type: :request do
  let(:user) { create(:user) }

  def user_token_logged_in(user)
    params = { auth: { email: user.email, password: 'password' } }
    post api_url('/user_token'), params: params
  end

  def setup
    @user = active_user
    @key = UserAuth.token_access_key
    user_token_logged_in(@user)
  end

  xdescribe '#create' do
    it 'アクセストークンはCookieに保存されているか' do
      cookie_token = @request.cookie_jar[@key]
      expect(cookie_token).to be_present
    end
  end
end
