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
    |description|text|

  - word : オタク用語
  - meaning : オタク用語を標準語で端的に表したもの
  - description : 解説。その用語が生まれた背景など。   
    
- #### Model:Category
  - その名の通りカテゴリーを保存するテーブル
  - 例：アイドル、１９９０年代、２０００年代、アニメなど
  - Wordとは**多対多**の関係にある
  - テーブル名：categories

    |カラム名|型|
    |:---:|:---:|
    |name|String|
    |description|text|
  
  - name : カテゴリーの名前
  - description : カテゴリーの解説

- #### Model:CategoryAndWord
  - テーブル名：CategoryAndOtakuWordRelationship
  - OtakuWordとCategoryの中間テーブル
  
    |カラム名|型|
    |:---:|:---:|
    |otaku_word_id|Int|
    |category_id|Int|

### 管理者権限
- 投稿
- 削除
- 編集

gem active_adminで管理画面を作成する。認証はDeviseを使う。

**他のユーザーの権限は閲覧のみである。**

### 検索機能
**ransackを使う**
オタク用語・意味のどちらでも検索できる
ラジオボタンで選択させたい
