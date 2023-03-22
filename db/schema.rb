# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_02_104534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "アカウント", force: :cascade do |t|
    t.string "username", null: false, comment: "ユーザーネーム"
    t.string "password_digest", null: false, comment: "パスワードのハッシュ値"
    t.boolean "is_system_admin", default: false, null: false, comment: "adminか"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_accounts_on_username", unique: true
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "genre_categories", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "ジャンルカテゴリー", force: :cascade do |t|
    t.string "name", null: false, comment: "カテゴリー名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_genre_categories_on_name", unique: true
  end

  create_table "genre_followings", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "ジャンルフォロー", force: :cascade do |t|
    t.uuid "account_id"
    t.uuid "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "genre_id"], name: "index_genre_followings_on_account_id_and_genre_id", unique: true
    t.index ["account_id"], name: "index_genre_followings_on_account_id"
    t.index ["genre_id"], name: "index_genre_followings_on_genre_id"
  end

  create_table "genres", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "ジャンル", force: :cascade do |t|
    t.string "name", null: false, comment: "ジャンル名"
    t.uuid "genre_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_category_id"], name: "index_genres_on_genre_category_id"
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "項目", force: :cascade do |t|
    t.string "name", null: false, comment: "項目名"
    t.uuid "ranking_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count", comment: "Likes数"
    t.uuid "account_id"
    t.text "description", comment: "詳細"
    t.index ["account_id"], name: "index_items_on_account_id"
    t.index ["name", "ranking_id"], name: "index_items_on_name_and_ranking_id", unique: true
    t.index ["ranking_id"], name: "index_items_on_ranking_id"
  end

  create_table "jtis", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "JWTのホワイトリスト", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "いいね", force: :cascade do |t|
    t.uuid "account_id"
    t.uuid "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "item_id"], name: "index_likes_on_account_id_and_item_id", unique: true
    t.index ["account_id"], name: "index_likes_on_account_id"
    t.index ["item_id"], name: "index_likes_on_item_id"
  end

  create_table "ranking_genres", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "RankingとGenreの中間テーブル", force: :cascade do |t|
    t.uuid "ranking_id"
    t.uuid "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_ranking_genres_on_genre_id"
    t.index ["ranking_id", "genre_id"], name: "index_ranking_genres_on_ranking_id_and_genre_id", unique: true
    t.index ["ranking_id"], name: "index_ranking_genres_on_ranking_id"
  end

  create_table "rankings", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "ランキング", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.integer "genre", default: 0, null: false, comment: "ジャンル"
    t.uuid "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "items_count", comment: "Items数"
    t.index ["creator_id"], name: "index_rankings_on_creator_id"
    t.index ["title"], name: "index_rankings_on_title", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "genre_followings", "accounts", on_delete: :cascade
  add_foreign_key "genre_followings", "genres", on_delete: :cascade
  add_foreign_key "genres", "genre_categories", on_delete: :cascade
  add_foreign_key "items", "accounts", on_delete: :cascade
  add_foreign_key "items", "rankings", on_delete: :cascade
  add_foreign_key "likes", "accounts", on_delete: :cascade
  add_foreign_key "likes", "items", on_delete: :cascade
  add_foreign_key "ranking_genres", "genres", on_delete: :cascade
  add_foreign_key "ranking_genres", "rankings", on_delete: :cascade
  add_foreign_key "rankings", "accounts", column: "creator_id", on_delete: :cascade
end
