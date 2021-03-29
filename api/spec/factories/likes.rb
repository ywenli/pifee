FactoryBot.define do
  factory :like do
    user_id { 1 }
    work_id { 1 }
    ## associationはrspecでのみ有効にする
    #association :user
  end
end
