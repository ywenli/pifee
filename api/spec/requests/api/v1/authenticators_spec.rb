require 'rails_helper'

RSpec.describe 'Authenticators', type: :request do
  describe 'JWTのデコード' do
    let(:user) { create(:user, activated: true) }
    let(:token) { user.to_token }
    let(:payload) { UserAuth::AuthToken.new(token: token).payload }

    it 'subjectは一致するか' do
      sub = payload['sub']
      expect(user.id).to eq sub
    end

    it 'expirationの値はあるか' do
      exp = payload['exp']
      expect(exp).not_to be_blank
    end

    it 'tokenの有効期限は2週間か(1分以内の差は許容)' do
      exp = payload['exp']
      expect(Time.zone.at(exp)).to be_within(1.minute).of(2.weeks.from_now)
    end

    it 'audienceの値はあるか' do
      aud = payload['aud']
      expect(aud).to be_present
    end

    it 'audienceの値は一致しているか' do
      aud = payload['aud']
      expect(ENV['API_DOMAIN']).to eq aud
    end
  end

  describe 'authenticate_user()メソッド' do
    let(:user) { create(:user, activated: true) }
    let(:other_user) { create(:user, activated: true) }
    let(:token) { user.to_token }
    let(:key) { UserAuth.token_access_key }

    it 'userとcurrent_userは一致しているか' do
      cookies[key] = token
      get api_url('/users/current_user'), params: { id: user.id }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.to_json)
    end

    it '無効なトークンはアクセス不可か' do
      invalid_token = "#{token}invalid"
      cookies[key] = invalid_token
      get api_url('/users/current_user'), params: { id: user.id }
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to be_blank
    end

    it 'トークンがない場合はアクセス不可か' do
      cookies[key] = nil
      get api_url('/users/current_user'), params: { id: user.id }
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to be_blank
    end

    it 'トークンの有効期限内はアクセス可能か' do
      # トークンの有効期限である2週間後の1分前に移動
      travel_to(UserAuth.token_lifetime.from_now - 1.minute)
      cookies[key] = token
      get api_url('/users/current_user'), params: { id: user.id }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.to_json)
    end

    it 'トークンの有効期限が切れた場合はアクセス不可か' do
      # トークンの有効期限である2週間後の1分後に移動
      travel_to(UserAuth.token_lifetime.from_now + 1.minute)
      get api_url('/users/current_user'), params: { id: user.id }
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to be_blank
    end

    it 'リクエストヘッダーにトークンがある場合、ヘッダートークンが優先されるか' do
      cookies[key] = token
      header_token = other_user.to_token

      get api_url('/users/current_user'), params: { id: user.id }, headers: { Authorization: "Bearer #{header_token}" }

      # Authenticatorのトークンはheaderトークンか
      expect(header_token).to eq(@controller.send(:token))
      # current_userはother_userか
      expect(other_user).to eq(@controller.send(:current_user))
    end
  end
end
