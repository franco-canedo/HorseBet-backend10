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

ActiveRecord::Schema.define(version: 2020_04_28_221228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boos", force: :cascade do |t|
    t.integer "game_id"
    t.integer "horse_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_horses", force: :cascade do |t|
    t.integer "game_id"
    t.integer "horse_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_users", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.float "extra_bet"
    t.float "total_bet"
    t.boolean "bettable", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_winners", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.integer "horse_id"
    t.integer "moneyWon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.float "jackpot"
    t.integer "minimum_bet"
    t.string "winner"
    t.integer "bets_placed", default: 0
    t.boolean "active", default: false
    t.boolean "bettable", default: false
    t.boolean "joinable", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "horses", force: :cascade do |t|
    t.string "name"
    t.integer "speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hypes", force: :cascade do |t|
    t.integer "game_id"
    t.integer "horse_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_horses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "horse_id"
    t.integer "game_id"
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "avatar"
    t.integer "winnings", default: 0
    t.float "deposit", default: 0.0
    t.integer "number_wins", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wins", force: :cascade do |t|
    t.integer "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
