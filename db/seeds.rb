# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

icons = %w[heart-solid.svg book-open-solid.svg utensils-solid.svg building-solid.svg home-solid.svg hard-hat-solid.svg yen-sign-solid.svg female-solid.svg]
items = %w[健康 教育 食事 仕事 住まい 安全 マネー ママの悩み]

  items.zip(icons) do |t, c|
    url = 'app/assets/images/'
    Category.create!(category: t,
                     icon: open(url + c))
  end

100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@example.org"
  introduction = "#{name}です。宜しくおねがいします。"
  User.create!(name: name,
               email: email,
               password: 'password',
               password_confirmation: 'password',
               introduction: introduction)
end

100.times do |n|
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

10.times do
  title = Faker::Lorem.sentence(word_count: 3)
  content = Faker::Lorem.sentence(word_count: 30)
  category = Category.all.sample
  user = User.all.sample
  Consultation.create!(title: title,
                       content: content,
                       pregnant: 1,
                       user_id: user.id,
                       category_id: category.id)
end

40.times do
  title = Faker::Lorem.sentence(word_count: 3)
  content = Faker::Lorem.sentence(word_count: 30)
  category = Category.all.sample
  user = User.all.sample
  Consultation.create!(title: title,
                       content: content,
                       pregnant: 0,
                       child_age_moon_age: rand(0..47),
                       user_id: user.id,
                       category_id: category.id)
end

40.times do
  content = Faker::Lorem.sentence(word_count: 30)
  consultation = Consultation.order(:created_at).last(3).sample
  user = User.all.sample
  ConsultationComment.create!(content: content,
                              user_id: user.id,
                              consultation_id: consultation.id)
end

10.times do
  title = Faker::Lorem.sentence(word_count: 3)
  content = Faker::Lorem.sentence(word_count: 30)
  category = Category.all.sample
  user = User.all.sample
  s1 = Date.parse('2020/11/30')
  s2 = Date.parse('2021/03/31')
  s = Random.rand(s1..s2)
  Vote.create!(title: title,
               content: content,
               pregnant: 1,
               user_id: user.id,
               category_id: category.id,
               closed_at: s)
end

40.times do
  title = Faker::Lorem.sentence(word_count: 3)
  content = Faker::Lorem.sentence(word_count: 30)
  category = Category.all.sample
  user = User.all.sample
  s1 = Date.parse('2020/11/30')
  s2 = Date.parse('2021/03/31')
  s = Random.rand(s1..s2)
  Vote.create!(title: title,
               content: content,
               pregnant: 0,
               child_age_moon_age: rand(0..47),
               user_id: user.id,
               category_id: category.id,
               closed_at: s)
end

40.times do |n|
  item = Faker::Lorem.sentence(word_count: 7)
  VoteItem.create!(item: item,
                   vote_id: n + 1,
                   item_number: 1)
end

40.times do |n|
  item = Faker::Lorem.sentence(word_count: 7)
  VoteItem.create!(item: item,
                   vote_id: n + 1,
                   item_number: 2)
end

40.times do |n|
  item = Faker::Lorem.sentence(word_count: 7)
  VoteItem.create!(item: item,
                   vote_id: n + 1,
                   item_number: 3)
end

40.times do |n|
  item = Faker::Lorem.sentence(word_count: 7)
  VoteItem.create!(item: item,
                   vote_id: n + 1,
                   item_number: 4)
end
