# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_04_070529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_locale_statuses", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "locale_id"
    t.boolean "is_main"
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_locale_statuses_on_book_id"
    t.index ["locale_id"], name: "index_book_locale_statuses_on_locale_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", default: "不明"
    t.datetime "issued_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "dm_pairs", force: :cascade do |t|
    t.bigint "sender_id_id"
    t.bigint "recipient_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id_id"], name: "index_dm_pairs_on_recipient_id_id"
    t.index ["sender_id_id"], name: "index_dm_pairs_on_sender_id_id"
  end

  create_table "locales", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "follower_id_id"
    t.bigint "followed_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id_id"], name: "index_relationships_on_followed_id_id"
    t.index ["follower_id_id"], name: "index_relationships_on_follower_id_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dm_pair_id"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dm_pair_id"], name: "index_rooms_on_dm_pair_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_sentences_on_book_id"
  end

  create_table "translations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sentence_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sentence_id"], name: "index_translations_on_sentence_id"
    t.index ["user_id"], name: "index_translations_on_user_id"
  end

  create_table "user_book_favarites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_user_book_favarites_on_book_id"
    t.index ["user_id"], name: "index_user_book_favarites_on_user_id"
  end

  create_table "user_locale_statuses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "locale_id"
    t.boolean "is_native"
    t.boolean "is_wanted"
    t.string "wanted_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale_id"], name: "index_user_locale_statuses_on_locale_id"
    t.index ["user_id"], name: "index_user_locale_statuses_on_user_id"
  end

  create_table "user_translation_comments", force: :cascade do |t|
    t.bigint "translation_id"
    t.bigint "user_id"
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translation_id"], name: "index_user_translation_comments_on_translation_id"
    t.index ["user_id"], name: "index_user_translation_comments_on_user_id"
  end

  create_table "user_translation_favarites", force: :cascade do |t|
    t.bigint "translation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translation_id"], name: "index_user_translation_favarites_on_translation_id"
    t.index ["user_id"], name: "index_user_translation_favarites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "profile"
    t.string "icon"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "book_locale_statuses", "books"
  add_foreign_key "book_locale_statuses", "locales"
  add_foreign_key "books", "users"
  add_foreign_key "dm_pairs", "users", column: "recipient_id_id"
  add_foreign_key "dm_pairs", "users", column: "sender_id_id"
  add_foreign_key "relationships", "users", column: "followed_id_id"
  add_foreign_key "relationships", "users", column: "follower_id_id"
  add_foreign_key "rooms", "dm_pairs"
  add_foreign_key "rooms", "users"
  add_foreign_key "sentences", "books"
  add_foreign_key "translations", "sentences"
  add_foreign_key "translations", "users"
  add_foreign_key "user_book_favarites", "books"
  add_foreign_key "user_book_favarites", "users"
  add_foreign_key "user_locale_statuses", "locales"
  add_foreign_key "user_locale_statuses", "users"
  add_foreign_key "user_translation_comments", "translations"
  add_foreign_key "user_translation_comments", "users"
  add_foreign_key "user_translation_favarites", "translations"
  add_foreign_key "user_translation_favarites", "users"
end
