require 'rails_helper'

RSpec.describe Work, type: :model do
  it 'タイトルが存在する場合、有効である' do
    work = create(:public, title: 'タイトル')
    expect(work).to be_valid
  end
  it 'タイトルが存在しない場合、無効である' do
    work = build(:public, title: nil)
    work.valid?
    expect(work.errors.full_messages).to include('タイトルを入力してください')
  end
end
