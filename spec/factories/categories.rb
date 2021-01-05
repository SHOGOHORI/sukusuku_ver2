FactoryBot.define do
  factory :category do
    category { 'MyString' }
    icon { open('app/assets/images/heart-solid.svg') }
  end
end
