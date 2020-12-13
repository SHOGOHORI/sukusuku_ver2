# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

items = %w[教育 健康 食事 安全 ママの悩み]
items.each do |i|
  Category.create!(category: i)
end

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@example.org"
  introduction = "#{name}です。宜しくおねがいします。"
  User.create!(name: name,
               email: email,
               password: 'password',
               password_confirmation: 'password',
               introduction: introduction)
end

30.times do |n|
  nick_name = Faker::Games::Pokemon.name
  s1 = Date.parse('2018/01/01')
  s2 = Date.parse('2021/06/15')
  s = Random.rand(s1..s2)
  Child.create!(user_id: n + 1,
                nick_name: nick_name,
                child_number: 1,
                birthday: s,
                comment: "#{nick_name}だ。")
end

50.times do
  title = Faker::Lorem.sentence(word_count: 3)
  content = Faker::Lorem.sentence(word_count: 30)
  category = Category.all.sample
  user = User.all.sample
  Consultation.create!(title: title,
                       content: content,
                       user_id: user.id,
                       category_id: category.id)
end

30.times do
  content = Faker::Lorem.sentence(word_count: 30)
  consultation = Consultation.order(:created_at).take(6).sample
  user = User.all.sample
  ConsultationComment.create!(content: content,
                               user_id: user.id,
                               consultation_id: consultation.id)
end
