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

# サンプル質問、回答(1)
health = Category.find_by(category: '健康')
consultation_first = Consultation.create!(title: '生後一ヶ月のイビキについて',
                                          content: "こんにちは。生後1ヶ月になる娘がいます。\n
                                                   夜中になるとフガフガとイビキをかいていて息苦しそうにしています。\n
                                                   寝ている間にSIDSにならないか心配です。\n
                                                   このまま様子を見るだけで良いのか、それとも鼻の吸引などしてあげた方がいいのでしょうか？",
                                          pregnant: 0,
                                          child_age_moon_age: 1,
                                          user_id: 3,
                                          category_id: health.id)

ConsultationComment.create!(content: "こんにちは。\n
                                      息苦しそうにしている赤ちゃんを見ていると心配になりますよね。\n
                                      赤ちゃんは大人より鼻孔が狭いためイビキをかきやすいです。\n
                                      イビキをかいているときに無呼吸にはなっておらず、顔色も悪くなく、起きているときに元気そうにしていれば大きな問題はないかと思います。\n
                                      もしイビキがひどく心配なようでしたらお医者様に相談した方が良いかもしれません。",
                            user_id: 4,
                            consultation_id: consultation_first.id)

# サンプル質問、回答(2)
food = Category.find_by(category: '食事')
consultation_second = Consultation.create!(title: "離乳食を嫌がる",
                                          content: "数日前から離乳食をはじめました。\n
                                                    初日に10倍粥をあげたのですが全然食べてくれず、たらたらと口からこぼれてしまい…\n
                                                    最初だから仕方がないと思ったのですが、数日経った今も全然食べてくれません。\n
                                                    こぼしていたのは最初だけで今は食べさせると体をのけぞらせて嫌がります。\n
                                                    どうしたら食べてくれるでしょうか…",
                                          pregnant: 0,
                                          child_age_moon_age: 7,
                                          user_id: 3,
                                          category_id: food.id)

ConsultationComment.create!(content: "裏ごしはしっかりしていますか？\n
                                      赤ちゃんは母乳やミルクなどの液体以外を口にするのが初めてなので固形っぽさが残っていると戸惑ってしまいます。\n
                                      もし裏ごしがたらずつぶつぶしているようだったらしっかり裏ごしすると少し違うかもしれません。",
                            user_id: 4,
                            consultation_id: consultation_second.id)

ConsultationComment.create!(content: "うちも10倍粥嫌がりました！\n
                                      にんじんのペーストは食べてくれたのでおかゆににんじんを混ぜてあげたら食べてくれるようになりましたよ！\n
                                      無理してバランスよくあげることだけ考えずに食べられるものから食事に慣らしていくのも良いかもしれません(^^)",
                            user_id: 5,
                            consultation_id: consultation_second.id)

# サンプル質問、回答(3)
consultation_third = Consultation.create!(title: "寝返りで起きる",
                                          content: "寝返りを覚えたばかりの息子が夜寝ている間に寝ぼけて？寝返りしてしまい苦しくなって起きて泣いてしまいます。\n
                                                    寝返りしないようにタオルを丸めたものをサイドにおいたのですが乗り越えて寝返りしてしまいます。\n
                                                    夜中毎晩のように起こされて寝かしつけをしているので寝不足になってしまいました。\n
                                                    どうにか寝返りせずに寝てもらうにはどうしたら良いでしょうか？",
                                          pregnant: 0,
                                          child_age_moon_age: 6,
                                          user_id: 3,
                                          category_id: health.id)

ConsultationComment.create!(content: "こんにちは。ゆっくりと眠れない夜が続くとつらいですよね。\n
                                      うちは寝返りをし始めた頃は２リットルペットボトルに水を入れて蓋をテープでしっかり留めたものを何個か用意してそれをタオルに巻いてストッパーにしていましたよ。\n
                                      時折それでも寝返りしてしまうことがありましたが、もう潔く夜は眠れないもの（新生児の頃もそうでしたし）と割り切って昼夜問わず子供が寝ているときに一緒に細切れで寝るようにしていました。\n
                                      いずれ寝返り返りを覚えるのでそれまでの辛抱です！眠れるときに寝てくださいね！",
                            user_id: 4,
                            consultation_id: consultation_third.id)

# 40.times do |n|
#   item = Faker::Lorem.sentence(word_count: 7)
#   VoteItem.create!(item: item,
#                    vote_id: n + 1,
#                    item_number: 1)
# end

# 40.times do |n|
#   item = Faker::Lorem.sentence(word_count: 7)
#   VoteItem.create!(item: item,
#                    vote_id: n + 1,
#                    item_number: 2)
# end

# 40.times do |n|
#   item = Faker::Lorem.sentence(word_count: 7)
#   VoteItem.create!(item: item,
#                    vote_id: n + 1,
#                    item_number: 3)
# end

# 40.times do |n|
#   item = Faker::Lorem.sentence(word_count: 7)
#   VoteItem.create!(item: item,
#                    vote_id: n + 1,
#                    item_number: 4)
# end
