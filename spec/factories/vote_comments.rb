FactoryBot.define do
  factory :vote_comment do
    content { "MyText" }
    user { nil }
    vote { nil }
  end
end
