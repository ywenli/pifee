FactoryBot.define do
  factory :user do
    sequence(:url) { |n| "user#{n}_url" }
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |_n| "#{name}@example.com" }
    sequence(:profile) { |_n| "#{name}のプロフィール" }
    password { 'password' }
    activated { true }

    trait :with_works do
      after(:build) do |user|
        user.works << create(:public)
      end
    end
    trait :with_likes do
      after(:build) do |user|
        user.likes << create(:like)
      end
    end
  end

  # TODO: traitを使ってリファクタリングする
  # テスト用
  # factory :user_test do
  #  sequence(:url) { |n| "user#{n}_test_url" }
  #  sequence(:name) { |n| "user#{n}_test" }
  #  sequence(:email) { |n| "#{name}_test@example.com" }
  #  sequence(:profile) { |n| "#{name}_testのプロフィール" }
  #  password { 'password' }
  #  activated { true }
  # end
end
