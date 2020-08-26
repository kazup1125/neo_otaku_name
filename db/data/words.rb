# categories
the_1990s = Category.find_by(name: '1990年代')
the_2000s = Category.find_by(name: '2000年代')
the_2010s = Category.find_by(name: '2010年代')
idol = Category.find_by(name: 'アイドル')
anime = Category.find_by(name: 'アニメ')
from_mistake = Category.find_by(name: '誤変換、誤読、誤入力')

words = [
  { base: { word: 'キボンヌ', meaning: '希望する', description: '「希望」と「イボンヌ」という名前を合わせた合成語。'}, relation: [the_1990s]},
  { base: { word: 'キター', meaning: '来た', description: 'ｷﾀ━━━━━━(ﾟ∀ﾟ)━━━━━━ !!!!!' }, relation: [the_1990s]},
  { base: { word: '推し', meaning: '一押し　イチオシ　お気に入り', description: '一推しのメンバーを意味する略語“推しメン”をさらに略したもの。' }, relation: [idol, the_2010s]},
  { base: { word: 'エモい', meaning: 'emotional(エモーショナル)　感情的な', description: 'とりあえず「エモい」と言っておけば何とかなる。' }, relation: [the_2000s] },
  { base: { word: 'うp', meaning: 'アップロード', description: 'アップロードのアップ(UP)、を日本語打ちした単語。' }, relation: [from_mistake] },
  { base: { word: 'ぽまいら', meaning: 'お前ら', description: '' }, relation: [the_2000s] },
  { base: { word: 'ナマポ', meaning: '生活保護', description: '生活保護を略した"生保”の訓読み。'}, relation: [the_2000s] },
  { base: { word: 'メシウマ', meaning: '他人の不幸で飯がうまい', description: ''}, relation: [the_2000s] },
  { base: { word: 'ようつべ', meaning: 'YouTube', description: 'YouTubeをローマ字読みしたもの。'}, relation: [the_2000s, from_mistake] },
  { base: { word: 'マミる', meaning: '悲惨な最後を遂げること', description: '魔法少女まどかマギカのキャラクター、巴マミから。作中、敵に頭部を食いちぎられるという悲惨な死を遂げたことから生まれた。'}, relation: [anime, the_2010s] },
  { base: { word: 'あぴゅい', meaning: '暑い', description: 'とても暑いこと。'}, relation: [from_mistake] }
]

words.each do |word_attr|
  word = OtakuWord.new(word_attr[:base])
  word.categories = word_attr[:relation]
  word.save!
  print '.'
end
