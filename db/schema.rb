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

ActiveRecord::Schema[7.1].define(version: 2024_03_03_195833) do
  create_table "genres", force: :cascade do |t|
    t.string "genre_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_shows", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "msgenres", force: :cascade do |t|
    t.integer "movie_show_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_msgenres_on_genre_id"
    t.index ["movie_show_id"], name: "index_msgenres_on_movie_show_id"
  end

  create_table "playlist_items", force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "movie_show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_show_id"], name: "index_playlist_items_on_movie_show_id"
    t.index ["playlist_id"], name: "index_playlist_items_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "msgenres", "genres"
  add_foreign_key "msgenres", "movie_shows"
  add_foreign_key "playlist_items", "movie_shows"
  add_foreign_key "playlist_items", "playlists"
  add_foreign_key "playlists", "users"
end
