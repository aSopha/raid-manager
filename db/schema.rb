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

ActiveRecord::Schema.define(version: 2019_02_03_083715) do

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "warcraft_logs_link", null: false
    t.string "role", null: false
    t.string "player_name", null: false
    t.string "player_class", null: false
    t.float "heart_level", null: false
    t.float "item_level", null: false
    t.float "avg_normal_parse"
    t.float "avg_heroic_parse"
    t.float "avg_mythic_parse"
    t.index ["player_name"], name: "index_players_on_player_name", unique: true
  end

  create_table "roster_players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "roster_id"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_roster_players_on_player_id"
    t.index ["roster_id"], name: "index_roster_players_on_roster_id"
  end

  create_table "rosters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roster_name", null: false
    t.bigint "user_id"
    t.index ["roster_name"], name: "index_rosters_on_roster_name", unique: true
    t.index ["user_id"], name: "index_rosters_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_id", null: false
    t.string "battletag", null: false
    t.string "token"
    t.index ["account_id"], name: "index_users_on_account_id", unique: true
    t.index ["battletag"], name: "index_users_on_battletag", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

end
