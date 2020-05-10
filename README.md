# README

## ネオオタク用語辞典
### アプリ概要
- オタク用語がたくさん載っています。
- オタク用語を一覧で表示できます。
- オタク用語の意味を検索できます　
  - 例：キボンヌ→希望する
- 一般用語からオタク用語を検索できます。　
  - 例：本当？→こマ？
  
- Ruby version
  - 2.6.6

- データベース
  - mysql
  - 開発環境
    - neo_otaku_word_development
  
### テーブル
- #### Model:OtakuWord
  - オタク用語テーブル
  - オタク用語とその意味を保存する
  - Categoryとは**多対多**の関係にある
  - テーブル名：otaku_words
  
    |カラム名|型|
    |:---:|:---:|
    |word|String|
    |meaning|String|
    
- #### Model:Category
  - その名の通りカテゴリーを保存するテーブル
  - 例：アイドル、１９９０年代、２０００年代、アニメなど
  - Wordとは**多対多**の関係にある
  - テーブル名：categories

    |カラム名|型|
    |:---:|:---:|
    |category|Int|

- #### Model:CategoryOfWord
  - テーブル名：category_of_words
  - WordとCategoryの中間テーブル
  
    |カラム名|型|
    |:---:|:---:|
    |word_id|Int|
    |category_id|Int|
