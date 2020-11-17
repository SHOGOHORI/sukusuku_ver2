FactoryBot.define do
  factory :child do
    user { nil }
    child_number { 1 }
    nick_name { 'nick_name' }
    birthday { '2020-11-07' }
  end
end
