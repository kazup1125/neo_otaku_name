# README　ネオオタク用語辞典

## アプリ概要
- オタク用語がたくさん載っています。
- オタク用語を一覧で表示できます。
- オタク用語の意味を検索できます　
  - 例：キボンヌ→希望する
- 一般用語からオタク用語を検索できます。　
  - 例：本当？→こマ？
  
- Ruby version
  - 2.6.6

- データベース
  - postgresql
  - 開発環境
    - neo_otaku_word_development
    
## 管理者画面
ログイン方法
1. `/admin`にアクセス
2. 
- Email: `admin@login.com`
- Password: `Qh7Zu8SP`
  
## テーブル
- ### Model:OtakuWord
  - オタク用語テーブル
  - オタク用語とその意味を保存する
  - Categoryとは**多対多**の関係にある
  - テーブル名：otaku_words
  
    |カラム名|型|
    |:---:|:---:|
    |word|String|
    |meaning|String|
    |description|text|

  - word : オタク語
  - meaning : 標準語
  - description : 解説。その用語が生まれた背景など。   
    
- ### Model:Category
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

- ### Model:CategoryAndOtakuWordRelationship
  - テーブル名：category_and_otaku_word_relationships
  - OtakuWordとCategoryの中間テーブル
  
    |カラム名|型|
    |:---:|:---:|
    |otaku_word_id|Int|
    |category_id|Int|

## 管理者権限
- 投稿
- 削除
- 編集

認証はDeviseを使う。

**他のユーザーの権限は閲覧のみである。**

## 検索機能
**ransackを使う**
オタク用語・意味のどちらでも検索できる
ラジオボタンで選択させたい

## LINE Bot ネオオタク用語辞典

**ID**
@722iibij

- Heroku
- LINE Messaging API

上記二つを使用し、Botを作成しました。

このBotにはカテゴリの概念がなく、ただ変換ができるだけです。

例：
- 送信「希望する」　→　受信「キボンヌ」
- 送信「ぽまいら」　→　受信「お前ら」
