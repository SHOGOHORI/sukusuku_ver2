FactoryBot.define do
  factory :consultation_comment_reply do
    content { 'MyText' }
    image { '' }
    user { nil }
    consultation_comment { nil }
  end
end
