require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  before do
    create_list(:public, 5, tag_list: %w[Vue Nuxt Typescript])
    create_list(:private, 5, tag_list: %w[Vue Nuxt Typescript])
  end

  describe 'get /api/v1/tags #index' do
    it '全てのタグを取得する' do
      get '/api/v1/tags'
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      # TODO: テストが不十分なので修正する
      expect(json.length).to eq(3)
    end
  end

  describe 'get /api/v1/tags/:name #show' do
    it '特定のタグに紐づいたwork(公開中のみ)を取得する' do
      get "/api/v1/tags/Vue"
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(5)
      expect(json.first["tag_list"]).to include('Vue')
    end
  end
end
