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
Consultation.create!(title: '生後一ヶ月のイビキについて',
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
                            consultation_id: 1)

# サンプル質問、回答(2)
food = Category.find_by(category: '食事')
Consultation.create!(title: '離乳食を嫌がる',
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
                            consultation_id: 2)

ConsultationComment.create!(content: "うちも10倍粥嫌がりました！\n
                                      にんじんのペーストは食べてくれたのでおかゆににんじんを混ぜてあげたら食べてくれるようになりましたよ！\n
                                      無理してバランスよくあげることだけ考えずに食べられるものから食事に慣らしていくのも良いかもしれません(^^)",
                            user_id: 5,
                            consultation_id: 2)

# サンプル質問、回答(3)
Consultation.create!(title: '寝返りで起きる',
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
                            consultation_id: 3)

# サンプル質問、回答(4)
education = Category.find_by(category: '教育')
Consultation.create!(title: '汚い言葉を辞めさせたい',
                     content: "３歳の息子が「死ね」や「殺す」などという言葉を使うようになってしまいました…\n
                               はじめてその言葉を息子の口から聞いた時はショックでかたまってしまいました。\n
                               家でそんな言葉は使っていないつもりなのですが…外で覚えてきてしまったのでしょうか。\n
                               そういうことは言わないようにと注意しても笑うだけで聞いてくれません。\n
                               とても悲しいです。今すぐ辞めさせたいです。",
                     pregnant: 0,
                     child_age_moon_age: 39,
                     user_id: 8,
                     category_id: education.id)

ConsultationComment.create!(content: "今幼稚園に通っているうちの子どもも言いますよ！\n
                                      辞めなさいと言っても面白がるだけで辞めないんですよね～\n
                                      テレビや友達の真似なのかなと思ってます\n
                                      いずれその言葉の重みがわかれば自然と使わなくなるんじゃないですかね？\n
                                      一応諦めずに根気強くそういう言葉はよくないということだけは都度伝えるようにしてます！",
                            user_id: 9,
                            consultation_id: 4)

# サンプル質問、回答(5)
Consultation.create!(title: '吐き戻しはいつまで？',
                     content: "生後３ヶ月の娘がミルクの後毎回吐き戻します。\n
                               飲ませすぎなのかと思い量を減らしたのですが足りないのか泣いてしまい、結局たくさん飲んでは戻してしまいます。戻したあとも元気そうにしているので体調が悪いわけではなさそうです。\n
                               吐き戻しを減らすコツはありますか？また、いつまで吐き戻しは続くのでしょうか？",
                     pregnant: 0,
                     child_age_moon_age: 3,
                     user_id: 10,
                     category_id: health.id)

ConsultationComment.create!(content: "吐き戻しはだいたい３～４ヶ月ほどで落ち着いてきますが、個人差がありますので１歳頃まで続く子もいます。\n
                                      一日に何度も大量に吐いたり、吐いたものがピンク色だったりしませんか？その場合は病院で診てもらった方が良さそうです。",
                            user_id: 9,
                            consultation_id: 5)

ConsultationComment.create!(content: "赤ちゃんのお腹はとっくり上になっているのでちょっとの刺激で中身が出てしまうことがあります。\n
                                      うちの下の子もよく吐き戻すのでタオルをひいてなるべく家具など洗いづらいものを汚さないようにしています＾＾；\n
                                      代わりにタオルは一日何枚も洗います！",
                            user_id: 20,
                            consultation_id: 5)

# サンプル質問、回答(6)
Consultation.create!(title: '終わらないつわり・・・',
                     content: "現在妊娠５ヶ月です\n
                               つわりがいつまでも終わりません・・・\n
                               最近はお腹も少し出てきて腰痛にも悩まされるようになりました\n
                               眠ることもできず寝不足です\n
                               何をしていても気持ちが悪くただただ横になっているしかないのですが\n
                               横になっているだけでも吐き気と腰痛がつらいです\n
                               これがまだずっと続くのかもしれないと思うと憂鬱です・・・\n
                               一般的にはもうじき落ち着く頃らしいですが・・・毎日つらいです",
                     pregnant: 1,
                     user_id: 15,
                     category_id: health.id)

ConsultationComment.create!(content: "こればかりは個人差なのでなんとも言えませんが、遅くとも出産すると必ずつわりは終わります。\n
                                      いつになるかはわからないけれどいずれ絶対に終わるんです！\n
                                      さすがに出産まで続くことは稀なのできっとその前には終わると思います。\n
                                      現在５ヶ月ということで、たしかにそろそろ落ち着く頃ですね。\n
                                      じわじわおさまる人もいれば急にピタッとおさまる人もいるみたいです。\n
                                      つらくて仕方がない場合は産院に相談してみては？\n
                                      妊娠中でも飲める吐き気止めを処方してくれるところもありますよ。\n
                                      効き目はこれまた個人差がありますが効く人はかなり効くようです！\n
                                      少しでも早くつわりがおさまって素敵なマタニティライフが送れますように…\n
                                      頑張ってください、赤ちゃんに会えるのはもうすぐですよ！",
                            user_id: 9,
                            consultation_id: 6)
