FactoryBot.define do
  factory :category do
    category { 'MyString' }
    icon { open('app/assets/images/category_icon/plus-square-solid.png') }
  end
end
