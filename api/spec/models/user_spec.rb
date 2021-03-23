require 'rails_helper'

RSpec.describe User, type: :model do
  xdescribe '名前のバリデーション' do
    it '名前の入力' do
      user = User.new(email: 'test@example.com', password: 'password')
      user.save
      required_msg = ['名前を入力してください']
      expect(required_msg).to eq user.errors.full_messages
    end
  end
end
