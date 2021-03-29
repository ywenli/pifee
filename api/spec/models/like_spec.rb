require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:work) { create(:public) }
  it 'いいねをしたことがないworkに新規でいいねをする場合、有効である' do
    like = create(:like, user_id: user.id, work_id: work.id)
    expect(like).to be_valid
  end
  it 'いいねをしたことがあるworkに重複していいねする場合、無効である' do
    like = create(:like, user_id: user.id, work_id: work.id)
    like = build(:like, user_id: user.id, work_id: work.id)
    like.valid?
    expect(like.errors.full_messages).to include('Workはすでに存在します')
  end
end
