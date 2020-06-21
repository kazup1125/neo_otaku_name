# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create_or_find_by!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

## カテゴリー
category1 = Category.create_or_find_by!(name: '1990年代',
                            description: '1990年代に生まれた言葉。')
category2 = Category.create_or_find_by!(name: '2000年代',
                            description: '2000年代に生まれた言葉。')
category3 = Category.create_or_find_by!(name: '2000年代',
                            description: '2000年代に生まれた言葉。')
category4 = Category.create_or_find_by!(name: '2010年代',
                            description: '20100年代に生まれた言葉。')
category5 = Category.create_or_find_by!(name: 'アイドル',
                                        description: '主にアイドルオタクの中で使われている言葉。')

## オタク用語
word1 = OtakuWord.find_or_create_by(word: 'キボンヌ',
                                    meaning: '希望する',
                                    description: '「キボンヌ」は「希望」と「イボンヌ」という名前を合わせた合成語です。「イボンヌ」とは、2000年のシドニーオリンピックに女子100mハードルの種目で出場した「金沢イボンヌ」選手のこと。母親が日本人、父親がジャマイカ系アメリカ人の女子選手で、この種目で彼女は準決勝8位という活躍を見せました。「イボンヌ」という名前は海外では特に珍しい名前ではありませんが、日本人にとってはインパクトのある名前でした。そのインパクトの強さからネット上でイボンヌ選手の名前を「キボンヌ」ともじり、2ちゃんねるへ投稿され、一気に広まった言葉です。ちなみにイボンヌ選手は現在アメリカの大学の陸上部コーチとして活躍されています。',)
word2 = OtakuWord.find_or_create_by(word: 'キター',
                                    meaning: '来た',
                                    description: 'ｷﾀ━━━━━━(ﾟ∀ﾟ)━━━━━━ !!!!!\nである')
word3 = OtakuWord.find_or_create_by(word: '推し',
                                    meaning: '一押し　イチオシ　お気に入り',
                                    description: '一推しのメンバーを意味する略語“推しメン”をさらに略したもの。')
word4 = OtakuWord.find_or_create_by(word: 'エモい',
                                    meaning: 'emotional(エモーショナル)　感情的な',
                                    description: 'とりあえず「エモい」と言っておけば何とかなる。')
word5 = OtakuWord.find_or_create_by(word: 'うp',
                                    meaning: 'アップロード',
                                    description: 'アップロードの略で、画像や動画などをネット上にアップロードし他の人が見れるようにする事。アップロードをアップ(UP)、を日本語打ちした単語。')


word1.categories << category1

word2.categories << category2

word3.categories << category4
word3.categories << category5

word4.categories << category4
word4.categories << category5

word5.categories << category3
