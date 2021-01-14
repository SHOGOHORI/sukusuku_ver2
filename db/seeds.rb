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

# サンプル質問、回答(1)
health = Category.find_by(category: '健康')
Consultation.create!(title: '生後一ヶ月のイビキについて',
                     content: "こんにちは。生後1ヶ月になる娘がいます。
                              夜中になるとフガフガとイビキをかいていて息苦しそうにしています。
                              寝ている間にSIDSにならないか心配です。
                              このまま様子を見るだけで良いのか、それとも鼻の吸引などしてあげた方がいいのでしょうか？",
                     pregnant: 0,
                     child_age_moon_age: 1,
                     user_id: 3,
                     category_id: health.id)

ConsultationComment.create!(content: "こんにちは。
                                      息苦しそうにしている赤ちゃんを見ていると心配になりますよね。
                                      赤ちゃんは大人より鼻孔が狭いためイビキをかきやすいです。
                                      イビキをかいているときに無呼吸にはなっておらず、顔色も悪くなく、起きているときに元気そうにしていれば大きな問題はないかと思います。
                                      もしイビキがひどく心配なようでしたらお医者様に相談した方が良いかもしれません。",
                            user_id: 4,
                            consultation_id: 1)

# サンプル質問、回答(2)
food = Category.find_by(category: '食事')
Consultation.create!(title: '離乳食を嫌がる',
                     content: "数日前から離乳食をはじめました。
                               初日に10倍粥をあげたのですが全然食べてくれず、たらたらと口からこぼれてしまい…
                               最初だから仕方がないと思ったのですが、数日経った今も全然食べてくれません。
                               こぼしていたのは最初だけで今は食べさせると体をのけぞらせて嫌がります。
                               どうしたら食べてくれるでしょうか…",
                     pregnant: 0,
                     child_age_moon_age: 7,
                     user_id: 3,
                     category_id: food.id)

ConsultationComment.create!(content: "裏ごしはしっかりしていますか？
                                      赤ちゃんは母乳やミルクなどの液体以外を口にするのが初めてなので固形っぽさが残っていると戸惑ってしまいます。
                                      もし裏ごしがたらずつぶつぶしているようだったらしっかり裏ごしすると少し違うかもしれません。",
                            user_id: 4,
                            consultation_id: 2)

ConsultationComment.create!(content: "うちも10倍粥嫌がりました！
                                      にんじんのペーストは食べてくれたのでおかゆににんじんを混ぜてあげたら食べてくれるようになりましたよ！
                                      無理してバランスよくあげることだけ考えずに食べられるものから食事に慣らしていくのも良いかもしれません(^^)",
                            user_id: 5,
                            consultation_id: 2)

# サンプル質問、回答(3)
Consultation.create!(title: '寝返りで起きる',
                     content: "寝返りを覚えたばかりの息子が夜寝ている間に寝ぼけて？寝返りしてしまい苦しくなって起きて泣いてしまいます。
                               寝返りしないようにタオルを丸めたものをサイドにおいたのですが乗り越えて寝返りしてしまいます。
                               夜中毎晩のように起こされて寝かしつけをしているので寝不足になってしまいました。
                               どうにか寝返りせずに寝てもらうにはどうしたら良いでしょうか？",
                     pregnant: 0,
                     child_age_moon_age: 6,
                     user_id: 3,
                     category_id: health.id)

ConsultationComment.create!(content: "こんにちは。ゆっくりと眠れない夜が続くとつらいですよね。
                                      うちは寝返りをし始めた頃は２リットルペットボトルに水を入れて蓋をテープでしっかり留めたものを何個か用意してそれをタオルに巻いてストッパーにしていましたよ。
                                      時折それでも寝返りしてしまうことがありましたが、もう潔く夜は眠れないもの（新生児の頃もそうでしたし）と割り切って昼夜問わず子供が寝ているときに一緒に細切れで寝るようにしていました。
                                      いずれ寝返り返りを覚えるのでそれまでの辛抱です！眠れるときに寝てくださいね！",
                            user_id: 4,
                            consultation_id: 3)

# サンプル質問、回答(4)
education = Category.find_by(category: '教育')
Consultation.create!(title: '汚い言葉を辞めさせたい',
                     content: "３歳の息子が「死ね」や「殺す」などという言葉を使うようになってしまいました…
                               はじめてその言葉を息子の口から聞いた時はショックでかたまってしまいました。
                               家でそんな言葉は使っていないつもりなのですが…外で覚えてきてしまったのでしょうか。
                               そういうことは言わないようにと注意しても笑うだけで聞いてくれません。
                               とても悲しいです。今すぐ辞めさせたいです。",
                     pregnant: 0,
                     child_age_moon_age: 39,
                     user_id: 8,
                     category_id: education.id)

ConsultationComment.create!(content: "今幼稚園に通っているうちの子どもも言いますよ！
                                      辞めなさいと言っても面白がるだけで辞めないんですよね～
                                      テレビや友達の真似なのかなと思ってます
                                      いずれその言葉の重みがわかれば自然と使わなくなるんじゃないですかね？
                                      一応諦めずに根気強くそういう言葉はよくないということだけは都度伝えるようにしてます！",
                            user_id: 9,
                            consultation_id: 4)

# サンプル質問、回答(5)
Consultation.create!(title: '吐き戻しはいつまで？',
                     content: "生後３ヶ月の娘がミルクの後毎回吐き戻します。
                               飲ませすぎなのかと思い量を減らしたのですが足りないのか泣いてしまい、結局たくさん飲んでは戻してしまいます。戻したあとも元気そうにしているので体調が悪いわけではなさそうです。
                               吐き戻しを減らすコツはありますか？また、いつまで吐き戻しは続くのでしょうか？",
                     pregnant: 0,
                     child_age_moon_age: 3,
                     user_id: 10,
                     category_id: health.id)

ConsultationComment.create!(content: "吐き戻しはだいたい３～４ヶ月ほどで落ち着いてきますが、個人差がありますので１歳頃まで続く子もいます。
                                      一日に何度も大量に吐いたり、吐いたものがピンク色だったりしませんか？その場合は病院で診てもらった方が良さそうです。",
                            user_id: 9,
                            consultation_id: 5)

ConsultationComment.create!(content: "赤ちゃんのお腹はとっくり上になっているのでちょっとの刺激で中身が出てしまうことがあります。
                                      うちの下の子もよく吐き戻すのでタオルをひいてなるべく家具など洗いづらいものを汚さないようにしています＾＾；
                                      代わりにタオルは一日何枚も洗います！",
                            user_id: 20,
                            consultation_id: 5)

# サンプル質問、回答(6)
Consultation.create!(title: '終わらないつわり・・・',
                     content: "現在妊娠５ヶ月です
                               つわりがいつまでも終わりません・・・
                               最近はお腹も少し出てきて腰痛にも悩まされるようになりました
                               眠ることもできず寝不足です
                               何をしていても気持ちが悪くただただ横になっているしかないのですが
                               横になっているだけでも吐き気と腰痛がつらいです
                               これがまだずっと続くのかもしれないと思うと憂鬱です・・・
                               一般的にはもうじき落ち着く頃らしいですが・・・毎日つらいです",
                     pregnant: 1,
                     user_id: 21,
                     category_id: health.id)

ConsultationComment.create!(content: "こればかりは個人差なのでなんとも言えませんが、遅くとも出産すると必ずつわりは終わります。
                                      いつになるかはわからないけれどいずれ絶対に終わるんです！
                                      さすがに出産まで続くことは稀なのできっとその前には終わると思います。
                                      現在５ヶ月ということで、たしかにそろそろ落ち着く頃ですね。
                                      じわじわおさまる人もいれば急にピタッとおさまる人もいるみたいです。
                                      つらくて仕方がない場合は産院に相談してみては？
                                      妊娠中でも飲める吐き気止めを処方してくれるところもありますよ。
                                      効き目はこれまた個人差がありますが効く人はかなり効くようです！
                                      少しでも早くつわりがおさまって素敵なマタニティライフが送れますように…
                                      頑張ってください、赤ちゃんに会えるのはもうすぐですよ！",
                            user_id: 9,
                            consultation_id: 6)

# サンプル質問、回答(7)
Consultation.create!(title: '人見知り場所見知りが酷い',
                     content: "生後５ヶ月過ぎから人見知りや場所見知りをするようになりました。
                               外出すると火がついたように泣いてしまうのでどこにも行けません。
                               この時期がすぎるまで家で過ごしていてもそのうちおさまるのでしょうか？",
                     pregnant: 0,
                     child_age_moon_age: 5,
                     user_id: 23,
                     category_id: education.id)

ConsultationComment.create!(content: "家で過ごさずどんどん外に連れて行って上げた方が外に慣れて泣くことも減ると思います。
                                      最初のうちは泣いてしまって戸惑うかもしれませんが、赤ちゃんは泣いてしまうもの！
                                      割り切って赤ちゃんが泣いていても大丈夫そうなところから外に慣らしていくと良いと思います。",
                            user_id: 25,
                            consultation_id: 7)

# サンプル質問、回答(8)
problem = Category.find_by(category: 'ママの悩み')
Consultation.create!(title: '育児を手伝わない父親',
                     content: "夫が全くと言っていいほど育児をしません。
                               子どもは一人目で生後２ヶ月になりました。生後１ヶ月までは里帰りしていました。
                               私はまだ産後で体の調子が悪いのですが主人は育児だけでなく家事もろくすっぽやりません。
                               すべて私がひとりでやっています。
                               夫も子どものことはかわいがってはいるのですがオムツ替えもお風呂も拒否です。
                               たまにふと無性にかなしくなって子どもを抱いたままひとり泣いてしまいます。
                               みなさんの旦那様は産後の育児や家事を手伝ってくれましたか？
                               手伝ってくれるご家庭は何かお願いをしましたか？",
                     pregnant: 0,
                     user_id: 46,
                     category_id: problem.id)

ConsultationComment.create!(content: "うちは育児も家事もぼちぼち手伝ってくれていました。
                                      仕事で疲れている日は何もしてくれませんでしたが、仕方ないと思って諦めました。
                                      とくに何かお願いはしていませんが主人が仕事の休みの日などは家事をやってくれるように頼んで私は少しゆっくりしていました。
                                      旦那さんに何を言っても何もしてくれないのであれば実家に頼るのはどうでしょうか。
                                      ひとりきりで育児はノイローゼになってしまうかもしれません、頼れる人に頼っていきましょう！",
                            user_id: 38,
                            consultation_id: 8)

ConsultationComment.create!(content: "私は１歳になる子どもの父親です。
                                      私の妻も質問者と同様に、生後１ヶ月まで里帰りしてから、我が家に帰ってきました。
                                      当時私の仕事が忙しく、それを言い訳にして全く育児に参加しませんでした。
                                      しかし、同じ業務をしている先輩が、仕事もしっかりこなした上に、3歳になる子どもの育児に積極的に参加していました。
                                      その姿を見て仕事を言い訳にするのは間違っていた、やはり家族あっての自分だから、家族を大事にしないとな、と考えるようになり、少しづつ育児に参加するようになりました。
                                      それでもやはり「育児は母親がするもの」と考える人を変えるのは非常に難しいと考えます。
                                      他の方が回答しているように、もし育児が辛いようなのであれば、頼れる人に頼って場合によっては実家に帰ることも良いでしょう。",
                            user_id: 39,
                            consultation_id: 8)

# サンプル質問、回答(9)
Consultation.create!(title: '女の子の名前に「信夢叶」とつけたい',
                     content: "もうすぐ女の子を出産予定です。
                              「信夢叶」とかいて「しゆか」と名付けたいのですが読めますか？",
                     pregnant: 1,
                     user_id: 47,
                     category_id: problem.id)

ConsultationComment.create!(content: '無理ですね。読めません。',
                            user_id: 14,
                            consultation_id: 9)

ConsultationComment.create!(content: "信じた夢が叶うということでしょうか？素敵なお名前ですね＾＾
                         しゆかという読みもかわいいと思います♪
                         読めなくても素敵な意味を込めた名前ならお子さんは喜ぶと思いますよ！＾O＾",
                            user_id: 4,
                            consultation_id: 9)

ConsultationComment.create!(content: "漢字も読めないし音も珍しいので言われないとわからないですね…
                         いろんな名前をつける方がいますからお子さんのことを考えず親の自己満足で何をつけてもいいとは思いますが。",
                            user_id: 7,
                            consultation_id: 9)

ConsultationComment.create!(content: "子供はペットやおもちゃじゃありません。
                         よく考えて名前をつけてあげてください。",
                            user_id: 1,
                            consultation_id: 9)

# サンプル質問、回答(10)
Consultation.create!(title: '生後一ヶ月の男の子の臭い',
                     content: "生後一ヶ月になる男の子の母です。
                               新生児の頃はミルクの香りがしていたのに最近なんだか・・ちょっと臭いです・・(汗)
                               言い方があれですが加齢臭のような…
                               汗をたくさんかいたりしたわけではないと思うのですがツーンとした臭いに少しくらっとします。
                               赤ちゃんの匂いはいい匂いと聞いていたからびっくりしてます。
                               男の子ってみんなこうなんですか？それとも何か病気なんでしょうか？",
                     pregnant: 0,
                     child_age_moon_age: 1,
                     user_id: 45,
                     category_id: health.id)

ConsultationComment.create!(content: "うちの息子も生後間もない頃に主人の臭いをキツくしたような独特な臭いになっていた頃があります笑
                                      1歳になるまでには落ち着いていたかな？
                                      いつまで続いたかは覚えていないけれどいつの間にか臭わなくなってました
                                      当時は臭いな～笑と思っていたけど今思い返すと少し懐かしい臭いでちょっとだけ恋しいかもです笑",
                            user_id: 28,
                            consultation_id: 10)

# サンプル質問、回答(11)
health = Category.find_by(category: '健康')
Consultation.create!(title: '1才児の肌荒れについて',
                     content: "1歳になって間もない子どもの肌荒れがすごいです
                               数ヶ月前からお腹のあたりが真っ赤になってぶつぶつしています（写真のような状態です）
                               本人は痒がったり痛がったりしている様子はないのですが
                               見ていてとても可哀想です・・・
                               病院に相談に行ったら保湿で治ると言われたのですが
                               ベビーオイルで保湿していますがよくなっている様子はありません
                               ２度相談に行きましたが２回ともこのまま保湿するようにとしか言われませんでした
                               保湿しても治っている様子がないので心配です
                               かといってまた病院で同じことを言われるのも・・・
                               みなさまは肌荒れ対策として気をつけていることはありますか？",
                     pregnant: 0,
                     child_age_moon_age: 12,
                     user_id: 49,
                     category_id: health.id)

ConsultationComment.create!(content: "保湿用のクリームがお肌に合ってないのかも？
                                      別のクリームも試してみては？",
                            user_id: 11,
                            consultation_id: 11)

# サンプルアンケート(1)
vote = Vote.create!(title: '6ヶ月の子供の寝る時間について',
                    content: '6ヶ月の子供の寝る時間は何時ぐらいでしょうか？',
                    pregnant: 0,
                    child_age_moon_age: 6,
                    user_id: 49,
                    category_id: health.id,
                    closed_at: '2021/03/31')

v1 = VoteItem.create!(item: 'PM7:00〜8:00',
                      vote_id: vote.id,
                      item_number: 1)
v2 = VoteItem.create!(item: 'PM8:00〜9:00',
                      vote_id: vote.id,
                      item_number: 2)
v3 = VoteItem.create!(item: 'PM9:00〜10:00',
                      vote_id: vote.id,
                      item_number: 3)
v4 = VoteItem.create!(item: 'PM10:00〜',
                      vote_id: vote.id,
                      item_number: 4)

27.times do |n|
  VoteRelationship.create!(user_id: n + 1,
                           vote_item_id: v1.id)
end

15.times do |n|
  VoteRelationship.create!(user_id: n + 30,
                           vote_item_id: v2.id)
end

19.times do |n|
  VoteRelationship.create!(user_id: n + 50,
                           vote_item_id: v3.id)
end

21.times do |n|
  VoteRelationship.create!(user_id: n + 75,
                           vote_item_id: v4.id)
end

# サンプルアンケート(2)
vote = Vote.create!(title: 'スマホを与えるべきか',
                    content: '出先などで癇癪を起したときにスマホの知育アプリなどを遊ばせると黙って遊んでくれるのでよく利用しているのですが、義母がスマホばかりやらせるなと言います。
                                     みなさんはスマホによる子守をどう思いますか？',
                    pregnant: 0,
                    child_age_moon_age: 20,
                    user_id: 49,
                    category_id: education.id,
                    closed_at: '2020/12/10')

v1 = VoteItem.create!(item: '使ってもOK',
                      vote_id: vote.id,
                      item_number: 1)
v2 = VoteItem.create!(item: 'なるべく使わない',
                      vote_id: vote.id,
                      item_number: 2)
v3 = VoteItem.create!(item: 'まったく使わない',
                      vote_id: vote.id,
                      item_number: 3)

16.times do |n|
  VoteRelationship.create!(user_id: n + 1,
                           vote_item_id: v1.id)
end

18.times do |n|
  VoteRelationship.create!(user_id: n + 30,
                           vote_item_id: v2.id)
end

25.times do |n|
  VoteRelationship.create!(user_id: n + 50,
                           vote_item_id: v3.id)
end

# サンプルアンケート(3)
vote = Vote.create!(title: '子どもを叱るタイミング',
                    content: '最近こどもが伝い歩きを覚えました。
                              私も主人も基本的に自由にさせてあげたいと考えています。
                              しかし、一歩間違えたらケガをするような場所に行ってしまいそうなときに私は早めに注意して連れ戻すのですが、主人はギリギリまで見守っていて良いといいます。
                              どちらが正しいというのはないかもしれませんがみなさんならどうされますか？',
                    pregnant: 0,
                    child_age_moon_age: 11,
                    user_id: 49,
                    category_id: education.id,
                    closed_at: '2021/12/10')

v1 = VoteItem.create!(item: '早めに連れ戻す',
                      vote_id: vote.id,
                      item_number: 1)
v2 = VoteItem.create!(item: 'ギリギリまで見守る',
                      vote_id: vote.id,
                      item_number: 2)
v3 = VoteItem.create!(item: 'その他（コメント欄）',
                      vote_id: vote.id,
                      item_number: 3)

27.times do |n|
  VoteRelationship.create!(user_id: n + 1,
                           vote_item_id: v1.id)
end

15.times do |n|
  VoteRelationship.create!(user_id: n + 30,
                           vote_item_id: v2.id)
end

19.times do |n|
  VoteRelationship.create!(user_id: n + 50,
                           vote_item_id: v3.id)
end

# サンプルアンケート(4)
vote = Vote.create!(title: 'つわりはいつまで？',
                    content: '現在妊娠５か月です。つわりがつらいです。
                              みなさんはいつ頃つわりが終わりましたか？',
                    pregnant: 1,
                    user_id: 49,
                    category_id: problem.id,
                    closed_at: '2021/12/10')

v1 = VoteItem.create!(item: '5ヶ月未満',
                      vote_id: vote.id,
                      item_number: 1)
v2 = VoteItem.create!(item: '5～6ヵ月以下',
                      vote_id: vote.id,
                      item_number: 2)
v3 = VoteItem.create!(item: '7ヵ月以上',
                      vote_id: vote.id,
                      item_number: 3)
v3 = VoteItem.create!(item: 'つわりはなかった',
                      vote_id: vote.id,
                      item_number: 4)

27.times do |n|
  VoteRelationship.create!(user_id: n + 1,
                           vote_item_id: v1.id)
end

15.times do |n|
  VoteRelationship.create!(user_id: n + 30,
                           vote_item_id: v2.id)
end

19.times do |n|
  VoteRelationship.create!(user_id: n + 50,
                           vote_item_id: v3.id)
end
