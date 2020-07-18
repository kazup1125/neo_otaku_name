categories = [
  { name: '1990年代', description: '1990年代に生まれた言葉。' },
  { name: '2000年代', description: '2000年代に生まれた言葉。' },
  { name: '2010年代', description: '2010年代に生まれた言葉。' },
  { name: 'アイドル', description: '主にアイドルオタクの中で使われている言葉。' },
  { name: 'アニメ', description: 'アニメから発生した言葉。' },
  { name: 'ジャニーズ', description: 'ジャニーズのオタク（通称ジャニオタ）界隈から生まれた言葉。'},
  { name: '誤変換、誤読、誤入力', description: '誤変換、誤読、誤入力から生まれた言葉。'}
]

categories.each do |category|
  Category.create(category)
  print '.'
end