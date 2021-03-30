require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:user) { create(:user, activated: true) }
  describe 'GET /api/v1/users #index' do
    it '全てのユーザーを取得する' do
      create_list(:user, 5)
      get '/api/v1/users'
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(5)
    end
  end

  describe 'get /api/v1/users/:id #show' do
    it '特定のユーザーを取得する' do
      #logged_in(user)
      get "/api/v1/users/#{user.id}"
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      # ユーザーの情報が一致する
      expect(json['id']).to eq(user.id)
      expect(json['url']).to eq(user.url)
      expect(json['name']).to eq(user.name)
      expect(json['email']).to eq(user.email)
      expect(json['profile']).to eq(user.profile)
    end
  end

  describe 'put /api/v1/users/:id #edit' do
    it 'ユーザー情報を編集できる' do
      name = 'user_name_updated'
      profile = '変更後のプロフィール'
      valid_params = { id: user.id,
                        name: name,
                        profile: profile }
      #logged_in(user)
      put "/api/v1/users/#{user.id}", params: valid_params, as: :json
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json['name']).to eq(name)
      expect(json['profile']).to eq(profile)
    end
  end

end
