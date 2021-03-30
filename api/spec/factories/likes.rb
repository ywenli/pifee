FactoryBot.define do
  factory :like do
    sequence(:user_id) { |n| "#{n}" }
    sequence(:work_id) { |n| "#{n}" }
    ## associationはrspecでのみ有効にする
    #association :user
  end
    # 現在時刻を含む'1日'の範囲のなかでランダムな日付と時刻で上書きする
    trait :with_daily do
      created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end
    # 現在時刻を含む'1週間'の範囲のなかでランダムな日付と時刻で上書きする
    trait :with_weekly do
      created_at { Faker::Time.between(from: DateTime.now - 7, to: DateTime.now) }
      updated_at { Faker::Time.between(from: DateTime.now - 7, to: DateTime.now) }
    end
end
