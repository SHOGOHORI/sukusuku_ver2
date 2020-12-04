FactoryBot.define do
  factory :consultation do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "MyText#{n}" }
    user { nil }
  end
end
