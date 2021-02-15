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

ActiveRecord::Schema.define(version: 20_210_215_084_741) do
  create_table 'games', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'description', null: false
    t.date 'release_date', null: false
    t.string 'production', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'image'
  end

  create_table 'likes', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'game_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['game_id'], name: 'index_likes_on_game_id'
    t.index %w[user_id game_id], name: 'index_likes_on_user_id_and_game_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'reviews', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'game_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'body', null: false
    t.index ['game_id'], name: 'index_reviews_on_game_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.string 'crypted_password'
    t.string 'salt'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'role', default: 1, null: false
    t.string 'avatar'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'likes', 'games'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'reviews', 'games'
  add_foreign_key 'reviews', 'users'
end
