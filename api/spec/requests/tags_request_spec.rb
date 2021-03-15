require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  describe '全てのタグを取得' do
    it '200 okを返す' do
      get '/api/v1/tags'

      expect(response.status).to eq(200)
    end
  end

  describe '特定のタグを取得' do
    it '200 okを返す' do
      get '/api/v1/tags/1?name=awesome'

      expect(response.status).to eq(200)
    end
  end
end
