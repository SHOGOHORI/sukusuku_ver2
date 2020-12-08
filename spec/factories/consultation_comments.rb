FactoryBot.define do
  factory :consultation_comment do
    content { "MyText" }
    image { "" }
    user { nil }
    consultation { nil }
  end
end
