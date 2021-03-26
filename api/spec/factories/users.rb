FactoryBot.define do
  factory :user do
    sequence(:url) { |n| "user#{n}_url" }
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "#{name}@example.com" }
    sequence(:profile) { |n| "#{name}のプロフィール" }
    password { 'password' }
    activated { true }
  end

  # テスト用
  #factory :user_test do
  #  sequence(:url) { |n| "user#{n}_test_url" }
  #  sequence(:name) { |n| "user#{n}_test" }
  #  sequence(:email) { |n| "#{name}_test@example.com" }
  #  sequence(:profile) { |n| "#{name}_testのプロフィール" }
  #  password { 'password' }
  #  activated { true }
  #end
end
