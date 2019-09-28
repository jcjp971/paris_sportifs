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

ActiveRecord::Schema.define(version: 2019_09_26_062242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.string "foot_api_league_key"
    t.string "country_code"
    t.string "url1"
    t.string "url2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.date "date"
    t.bigint "team1_id"
    t.bigint "team2_id"
    t.bigint "championship_id"
    t.string "result"
    t.string "foot_api_fixture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["championship_id"], name: "index_matches_on_championship_id"
    t.index ["team1_id"], name: "index_matches_on_team1_id"
    t.index ["team2_id"], name: "index_matches_on_team2_id"
  end

  create_table "prono_sites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "logo"
    t.integer "tx_succes"
    t.integer "tx_accuracy"
    t.integer "tx_risk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pronostics", force: :cascade do |t|
    t.date "date"
    t.bigint "prono_site_id"
    t.bigint "match_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "advice"
    t.boolean "double_chance"
    t.string "prediction"
    t.index ["match_id"], name: "index_pronostics_on_match_id"
    t.index ["prono_site_id"], name: "index_pronostics_on_prono_site_id"
    t.index ["team_id"], name: "index_pronostics_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "foot_api_team_id"
    t.string "logo"
    t.string "name2"
    t.string "name3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "championships"
  add_foreign_key "pronostics", "matches"
  add_foreign_key "pronostics", "prono_sites"
  add_foreign_key "pronostics", "teams"
end
