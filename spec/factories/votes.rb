FactoryBot.define do
  factory :vote do
    title { 'MyString' }
    content { 'MyText' }
    image { '' }
    child_age_moon_age { 1 }
    pregnant { false }
    user { nil }
    category { '' }
    days { 1 }
    closed_at { '2021-03-07' }
  end
end
