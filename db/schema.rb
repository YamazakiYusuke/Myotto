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
    t.boolean "is_main", null: false
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_locale_statuses_on_book_id"
    t.index ["locale_id"], name: "index_book_locale_statuses_on_locale_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author"
    t.datetime "issued_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "dm_pairs", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_dm_pairs_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_dm_pairs_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_dm_pairs_on_sender_id"
  end

  create_table "locales", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
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

  create_table "user_book_favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_user_book_favorites_on_book_id"
    t.index ["user_id", "book_id"], name: "index_user_book_favorites_on_user_id_and_book_id", unique: true
    t.index ["user_id"], name: "index_user_book_favorites_on_user_id"
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

  create_table "user_translation_favorites", force: :cascade do |t|
    t.bigint "translation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translation_id", "user_id"], name: "index_user_translation_favorites_on_translation_id_and_user_id", unique: true
    t.index ["translation_id"], name: "index_user_translation_favorites_on_translation_id"
    t.index ["user_id"], name: "index_user_translation_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "profile"
    t.string "icon"
    t.string "email", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "book_locale_statuses", "books"
  add_foreign_key "book_locale_statuses", "locales"
  add_foreign_key "books", "users"
  add_foreign_key "rooms", "dm_pairs"
  add_foreign_key "rooms", "users"
  add_foreign_key "sentences", "books"
  add_foreign_key "translations", "sentences"
  add_foreign_key "translations", "users"
  add_foreign_key "user_book_favorites", "books"
  add_foreign_key "user_book_favorites", "users"
  add_foreign_key "user_locale_statuses", "locales"
  add_foreign_key "user_locale_statuses", "users"
  add_foreign_key "user_translation_comments", "translations"
  add_foreign_key "user_translation_comments", "users"
  add_foreign_key "user_translation_favorites", "translations"
  add_foreign_key "user_translation_favorites", "users"
end
