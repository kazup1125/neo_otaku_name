# frozen_string_literal: true

class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table 'active_admin_comments' do |t|
      t.string 'namespace'
      t.text 'body'
      t.string 'resource_type'
      t.bigint 'resource_id'
      t.string 'author_type'
      t.bigint 'author_id'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
      t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
      t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
    end

    create_table 'admin_users' do |t|
      t.string 'email', default: '', null: false, comment: 'Eメール'
      t.string 'encrypted_password', default: '', null: false, comment: 'パスワード'
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.index ['email'], name: 'index_admin_users_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
    end

    create_table 'categories' do |t|
      t.string 'name', comment: 'カテゴリー名'
      t.text 'description', comment: '説明'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
    end

    create_table 'category_and_otaku_word_relationships' do |t|
      t.bigint 'otaku_word_id', null: false, comment: 'オタク用語'
      t.bigint 'category_id', null: false, comment: 'カテゴリー'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.index ['category_id'], name: 'index_category_and_otaku_word_relationships_on_category_id'
      t.index ['otaku_word_id'], name: 'index_category_and_otaku_word_relationships_on_otaku_word_id'
    end

    create_table 'otaku_words' do |t|
      t.string 'word', comment: 'オタク用語'
      t.string 'meaning', comment: '意味'
      t.text 'description', comment: '説明'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
    end

    add_foreign_key 'category_and_otaku_word_relationships', 'categories'
    add_foreign_key 'category_and_otaku_word_relationships', 'otaku_words'
  end
end
