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

ActiveRecord::Schema[7.1].define(version: 2024_09_20_093421) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "collection_id", null: false
    t.index ["collection_id"], name: "index_playlists_on_collection_id"
    t.index ["song_id"], name: "index_playlists_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.date "release_date"
    t.bigint "artist_id", null: false
    t.string "lyrics"
    t.float "Time_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
  end

  create_table "user_playlists", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "wishlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_user_playlists_on_song_id"
    t.index ["wishlist_id"], name: "index_user_playlists_on_wishlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "playlists", "collections"
  add_foreign_key "playlists", "songs"
  add_foreign_key "songs", "artists"
  add_foreign_key "user_playlists", "songs"
  add_foreign_key "user_playlists", "wishlists"
  add_foreign_key "wishlists", "users"
end
