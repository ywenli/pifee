FactoryBot.define do
  factory :like do
    sequence(:user_id) { |n| n }
    sequence(:work_id) { |n| n }

    # 現在時刻を含む'1日'の範囲のなかでランダムな日付と時刻で上書きする
    trait :with_daily do
      created_at { Faker::Time.between(from: 1.days.ago, to: Time.current) }
      updated_at { Faker::Time.between(from: 1.days.ago, to: Time.current) }
    end
    # 現在時刻を含む'1週間'の範囲のなかでランダムな日付と時刻で上書きする
    trait :with_weekly do
      created_at { Faker::Time.between(from: 7.days.ago, to: Time.current) }
      updated_at { Faker::Time.between(from: 7.days.ago, to: Time.current) }
    end

    # 全てのランキングで表示させるseedデータ用のtrait(いいね数が段階的にに1ずつ増えいているlikeデータ)
    trait :for_seeds_user_1 do
      user_id { 1 }
      sequence(:work_id) { |n| n }
    end
    trait :for_seeds_user_2 do
      user_id { 2 }
      sequence(:work_id) { |n| n }
    end
    trait :for_seeds_user_3 do
      user_id { 3 }
      sequence(:work_id) { |n| n }
    end
    trait :for_seeds_user_4 do
      user_id { 4 }
      sequence(:work_id) { |n| n }
    end
    trait :for_seeds_user_5 do
      user_id { 5 }
      sequence(:work_id) { |n| n }
    end
    trait :for_seeds_user_6 do
      user_id { 6 }
      sequence(:work_id) { |n| n }
    end
    trait :for_seeds_user_7 do
      user_id { 7 }
      sequence(:work_id) { |n| n }
    end

    # 週間のランキングで表示させるseedデータ用のtrait(いいね数が段階的にに1ずつ増えいているlikeデータ)
    trait :for_seeds_user_11 do
      user_id { 11 }
      sequence(:work_id) { |n| n+10 }
    end
    trait :for_seeds_user_12 do
      user_id { 12 }
      sequence(:work_id) { |n| n+10 }
    end
    trait :for_seeds_user_13 do
      user_id { 13 }
      sequence(:work_id) { |n| n+10 }
    end
    trait :for_seeds_user_14 do
      user_id { 14 }
      sequence(:work_id) { |n| n+10 }
    end
    trait :for_seeds_user_15 do
      user_id { 15 }
      sequence(:work_id) { |n| n+10 }
    end
    trait :for_seeds_user_16 do
      user_id { 16 }
      sequence(:work_id) { |n| n+10 }
    end
    trait :for_seeds_user_17 do
      user_id { 17 }
      sequence(:work_id) { |n| n+10 }
    end

    # デイリーランキングで表示させるseedデータ用のtrait(いいね数が段階的にに1ずつ増えいているlikeデータ)
    trait :for_seeds_user_21 do
      user_id { 21 }
      sequence(:work_id) { |n| n+20 }
    end
    trait :for_seeds_user_22 do
      user_id { 22 }
      sequence(:work_id) { |n| n+20 }
    end
    trait :for_seeds_user_23 do
      user_id { 23 }
      sequence(:work_id) { |n| n+20 }
    end
    trait :for_seeds_user_24 do
      user_id { 24 }
      sequence(:work_id) { |n| n+20 }
    end
    trait :for_seeds_user_25 do
      user_id { 25 }
      sequence(:work_id) { |n| n+20 }
    end
    trait :for_seeds_user_26 do
      user_id { 26 }
      sequence(:work_id) { |n| n+20 }
    end
    trait :for_seeds_user_27 do
      user_id { 27 }
      sequence(:work_id) { |n| n+20 }
    end

  end
end
