FactoryBot.define do
  factory :work do
    title { "MyString" }
    body { "MyText" }
    status { 1 }
    user { nil }
  end
end
