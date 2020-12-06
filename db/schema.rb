# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_05_140657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false, comment: "Eメール"
    t.string "encrypted_password", default: "", null: false, comment: "パスワード"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", comment: "カテゴリー名"
    t.text "description", comment: "説明"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_and_otaku_word_relationships", force: :cascade do |t|
    t.bigint "otaku_word_id", null: false, comment: "オタク用語"
    t.bigint "category_id", null: false, comment: "カテゴリー"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_and_otaku_word_relationships_on_category_id"
    t.index ["otaku_word_id"], name: "index_category_and_otaku_word_relationships_on_otaku_word_id"
  end

  create_table "otaku_words", force: :cascade do |t|
    t.string "word", comment: "オタク用語"
    t.string "meaning", comment: "意味"
    t.text "description", comment: "説明"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "category_and_otaku_word_relationships", "categories"
  add_foreign_key "category_and_otaku_word_relationships", "otaku_words"
end
