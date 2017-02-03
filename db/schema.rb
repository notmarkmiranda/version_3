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

ActiveRecord::Schema.define(version: 20170203054444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "games", force: :cascade do |t|
    t.date    "date"
    t.integer "buy_in_amount"
    t.integer "season_id"
    t.index ["season_id"], name: "index_games_on_season_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string  "name"
    t.string  "slug"
    t.integer "user_id"
    t.index ["user_id"], name: "index_leagues_on_user_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.citext  "first_name"
    t.citext  "last_name"
    t.integer "user_id"
    t.index ["user_id"], name: "index_participants_on_user_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.boolean "active",    default: true
    t.integer "league_id"
    t.index ["league_id"], name: "index_seasons_on_league_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "games", "seasons"
  add_foreign_key "leagues", "users"
  add_foreign_key "participants", "users"
  add_foreign_key "seasons", "leagues"
end
