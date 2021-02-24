require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:user) { User.find_by(activated: true) }

  xdescribe '#show' do
    it 'レスポンスは正しいか' do
      logged_in(@user)
      get '/api/v1/users/current_user'
      expect(response).to have_http_status '200'
    end
  end
end
