FactoryBot.define do
  factory :vote do
    title { 'MyString' }
    content { 'MyText' }
    image { '' }
    child_age { 1 }
    child_moon_age { 1 }
    pregnant { false }
    user { nil }
    category { '' }
  end
end
