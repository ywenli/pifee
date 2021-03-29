require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'url、プロフィール名、メールアドレス、パスワードがある場合' do
    it '有効である' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe 'URL' do
    it 'URLがない場合、無効である' do
      user = build(:user, url: nil)
      user.save
      expect(user.errors.full_messages).to include('URLを入力してください')
    end
    context '文字数が30文字以下の場合' do
      it '有効である' do
        user = build(:user)
        url ='a' * 30
        user.url = url
        expect(user).to be_valid
      end
    end
    context '文字数が31文字以上の場合' do
      it '無効である' do
        user = build(:user)
        url ='a' * 31
        user.url = url
        user.save
        expect(user.errors.full_messages).to include('URLは30文字以内で入力してください')
      end
    end
    it '重複したURLの場合、無効である' do
      user1 = create(:user, url: 'same_url')
      user2 = build(:user, url: 'same_url')
      user2.save
      expect(user2.errors.full_messages).to include('URLはすでに存在します')
    end
  end

  describe 'プロフィール名' do
    it 'プロフィール名がない場合、無効である' do
      user = build(:user, name: nil)
      user.save
      expect(user.errors.full_messages).to include('プロフィール名を入力してください')
    end
    context '文字数が30文字以下の場合' do
      it '有効である' do
        user = build(:user)
        name ='a' * 30
        user.name = name
        expect(user).to be_valid
      end
    end
    context '文字数が31文字以上の場合' do
      it '無効である' do
        user = build(:user)
        name ='a' * 31
        user.name = name
        user.save
        expect(user.errors.full_messages).to include('プロフィール名は30文字以内で入力してください')
      end
    end
  end

  describe 'メールアドレス' do
    it 'メールアドレスがない場合、無効である' do
      user = build(:user, email: nil)
      user.save
      expect(user.errors.full_messages).to include('メールアドレスを入力してください')
    end
    context '文字数が255文字以下の場合' do
      it '有効である' do
        user = build(:user)
        email ='a' * 243 + '@example.com'
        user.email = email
        expect(user).to be_valid
      end
    end
    context '文字数が256文字以上の場合' do
      it '無効である' do
        user = build(:user)
        email ='a' * 244 + '@example.com'
        user.email = email
        user.save
        expect(user.errors.full_messages).to include('メールアドレスは255文字以内で入力してください')
      end
    end
    it '重複したメールアドレスの場合、無効である' do
      user1 = create(:user, email: 'same_email@example.com')
      user2 = build(:user, email: 'same_email@example.com')
      user2.save
      expect(user2.errors.full_messages).to include('メールアドレスはすでに存在します')
    end
    it '無効なメールアドレスの場合、無効である' do
      user = build(:user)
      invalid_addresses = %w[user@example,com
                              user_at_foo.org
                              user.name@example.foo@bar_baz.com
                              foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        user.save
        expect(user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
    end
    it 'メールアドレスは小文字で保存される' do
      email = 'USER@EXAMPLE.COM'
      user = build(:user, email: email)
      user.save
      expect(user.email).to eq email.downcase
    end
    context '認証済みユーザーがいない場合' do
      # TODO: 認証済みユーザーと同じメールアドレスを登録することは未対応のため、テストはpendingにしています
      xit '同じメールアドレスでの登録は有効である' do
        email = 'same_email@example.com'
        user1 = create(:user, email: email, activated: false)
        user2 = build(:user, email: email)
        expect(user2).to be_valid
      end
    end
    context '認証済みユーザーがいる場合' do
      it '同じメールアドレスでの登録は無効になる' do
        email = 'same_email@example.com'
        user1 = create(:user, email: email, activated: true)
        user2 = build(:user, email: email)
        user2.save
        expect(user2.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

    end
  end

  describe 'パスワード' do
    it 'パスワードがない場合、無効である' do
      user = build(:user, password: nil)
      user.save
      expect(user.errors.full_messages).to include('パスワードを入力してください')
    end
    context '文字数が7文字以下の場合' do
      it '無効である' do
        user = build(:user)
        password ='a' * 7
        user.password = password
        user.save
        expect(user.errors.full_messages).to include('パスワードは8文字以上で入力してください')
      end
    end
    context '文字数が8文字以上の場合' do
      it '有効である' do
        user = build(:user)
        password ='a' * 8
        user.password = password
        expect(user).to be_valid
      end
    end
  end
end
