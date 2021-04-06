require 'rails_helper'

RSpec.describe 'Api::V1::UserTokens', type: :request do
  let(:user) { create(:user) }
  let(:key) { UserAuth.token_access_key }
  let(:cookie_token) { request.cookie_jar[key] }
  # cookieオプションの取得
  let(:cookie_options) { request.cookie_jar.instance_variable_get(:@set_cookies)[key.to_s] }
  let(:exp) { UserAuth::AuthToken.new(token: cookie_token).payload['exp'] }

  def user_token_logged_in(user)
    params = { auth: { email: user.email, password: 'password' } }
    post api_url('/user_token'), params: params
  end

  before do
    user_token_logged_in(user)
  end

  describe '#create' do
    it 'アクセストークンはCookieに保存されているか' do
      expect(cookie_token).to be_present
    end

    it 'expiresは一致しているか' do
      expect(cookie_options[:expires]).to eq(Time.zone.at(exp))
    end

    it 'secureは本番環境以外でfalseか' do
      expect(Rails.env).not_to be_production
      expect(cookie_options[:secure]).to be_falsey
    end

    it 'http_onlyはtrueか' do
      expect(cookie_options[:http_only]).to be_truthy
    end

    context 'レスポンスのテスト' do
      it 'レスポンスの有効期限は一致しているか' do
        expect(response_body['exp']).to eq(exp)
      end

      it 'レスポンスのユーザーは一致しているか' do
        expect(response_body['user']).to eq(user.my_json)
      end
    end
  end

  describe '#destroy' do
    it 'Cookieは削除されているか' do
      expect(request.cookie_jar[key]).to be_present

      delete api_url('/user_token')

      expect(response).to have_http_status(:ok)
      expect(request.cookie_jar[key]).to be_blank
    end
  end
end
