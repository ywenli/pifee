require 'rails_helper'
RSpec.describe "Api::V1::Works", type: :request do

  describe 'GET /api/v1/works/search #search' do
    before do
      create_list(:public, 5)
      create_list(:private, 5)
      search_work = create(:public, title: '存在するタイトル')
    end

    existing_title = "存在するタイトル"
    not_existing_title = '存在しないタイトル'
    valid_params = { params: existing_title }

    context '検索ワードが存在するタイトルの場合' do
      it '部分一致するタイトルのworkを返す' do
        get '/api/v1/works/search', params: { keyword: existing_title }
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(1)
      end
    end
    context '検索ワードが存在しないタイトルの場合' do
      it '空のjsonを返す' do
        get '/api/v1/works/search', params: { keyword: not_existing_title }
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(0)
      end
    end
  end
end
