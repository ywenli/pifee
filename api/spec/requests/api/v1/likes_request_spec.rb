require 'rails_helper'

RSpec.describe 'Api::V1::Likes', type: :request do
  let(:user) { create(:user) }
  let(:work) { create(:public) }
  let(:like) { create(:like, user_id: user.id, work_id: work.id) }
  let(:like_daily) { create(:like, :with_daily, user_id: user.id, work_id: work.id) }
  let(:like_weekly) { create(:like, :with_weekly, user_id: user.id, work_id: work.id) }

  describe 'GET /api/v1/likes' do
    it 'work_idに紐づいたいいねを取得する' do
      like
      get '/api/v1/likes'
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(1)
    end
  end

  describe 'POST /api/v1/likes #create' do
    it 'いいねを作成する' do
      expect do
        post '/api/v1/likes', params: {user_id: user.id, work_id: work.id}, as: :json
      end.to change(Like, :count).by(+1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /api/v1/likes/:id #delete' do
    it 'いいねを削除する' do
      like
      expect do
        delete "/api/v1/likes/#{like.id}", params: { user_id: user.id}
      end.to change(Like, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /api/v1/likes/all_ranking #get_top_6_in_all_ranking' do
    # TODO: テストが不十分なので修正する
    it '全期間のランキングで上位6つを取得する' do
      like
      get '/api/v1/likes/all_ranking'
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(1)
    end
  end
  describe 'GET /api/v1/likes/weekly_ranking #get_top_6_in_weekly_ranking' do
    # TODO: テストが不十分なので修正する
    it '週間のランキングで上位6つを取得する' do
      like_weekly
      get '/api/v1/likes/weekly_ranking'
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(1)
    end
  end
  describe 'GET /api/v1/likes/daily_ranking #get_top_6_in_daily_ranking' do
    it '1日のランキングで上位6つを取得する' do
      # TODO: テストが不十分なので修正する
      like_daily
      get '/api/v1/likes/daily_ranking'
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(1)
    end
  end
end
