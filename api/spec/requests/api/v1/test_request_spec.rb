require 'rails_helper'

RSpec.describe "Api::V1::Tests", type: :request do

  describe 'test' do
    it 'トップページが表示される' do
      get '/api/v1/test'
      expect(response).to have_http_status(:ok)
    end
  end
end
