require 'rails_helper'
RSpec.describe 'Api::V1::Works', type: :request do
  describe 'GET /api/v1/works #index' do
    it '全てのworkを取得する(公開中のみ)' do
      create_list(:public, 5)
      create_list(:private, 5)

      get '/api/v1/works'
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(5)
    end
  end

  describe 'GET /api/v1/works/:id #show' do
    it '特定のworkを取得する(公開中のみ)' do
      work = create(:public)

      get "/api/v1/works/#{work.id}"
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json['title']).to eq(work.title)
    end
  end

  describe 'GET /api/v1/works/all #all' do
    it '全てのworkを取得(下書き、公開中)' do
      create_list(:public, 5)
      create_list(:private, 5)

      get '/api/v1/works/all'
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(10)
    end
  end

  describe 'POST /api/v1/works #create' do
    it '新しいworkを作成する' do
      user = create(:user)
      valid_params = {  user_id: user.id,
                        title: 'タイトル',
                        body: '本文',
                        tag_list: %w[vue nuxt],
                        is_public: true }

      expect do
        post '/api/v1/works', params: valid_params, as: :json
      end.to change(Work, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/v1/works/:id #delete' do
    it 'workを削除する' do
      work = create(:public)

      expect do
        delete "/api/v1/works/#{work.id}"
      end.to change(Work, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'PATCH /api/v1/works/:id #update' do
    title = '変更後のタイトル'
    body = '変更後の本文'
    tag_list = ['update']
    is_public = false
    valid_params = { title: title,
                     body: body,
                     tag_list: tag_list,
                     is_public: is_public }
    invalid_params = { title: '' }
    context 'パラメータが正しい場合' do
      it '編集が成功する' do
        public_work = create(:public)
        put "/api/v1/works/#{public_work.id}", params: valid_params, as: :json
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json['title']).to eq(title)
        expect(json['body']).to eq(body)
        expect(json['tag_list']).to eq(tag_list)
        expect(json['is_public']).to eq(is_public)
      end
    end

    context 'パラメータが正しくない場合' do
      it '編集が失敗する' do
        public_work = create(:public)
        put "/api/v1/works/#{public_work.id}", params: invalid_params, as: :json
        json = JSON.parse(response.body)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /api/v1/works/search #search' do
    before do
      create_list(:public, 5)
      create_list(:private, 5)
      search_work = create(:public, title: '存在するタイトル')
    end

    existing_title = '存在するタイトル'
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
