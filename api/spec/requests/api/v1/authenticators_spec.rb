require 'rails_helper'

RSpec.describe 'Authenticators', type: :request do
  xdescribe 'JWTのデコード' do
    let(:user) { User.find_by(activated: true) }
    let(:token) { @user.to_token }

    payload = UserAuth::AuthToken.new(token: @token).payload
    subject = payload['sub']
    exp = payload['exp']
    aud = payload['aud']

    it 'subjectは一致するか' do
      expect(user.id).to eq subject
    end

    it 'expirationの値はあるか' do
      expect(exp).not_to be_empty
    end
  end
end
