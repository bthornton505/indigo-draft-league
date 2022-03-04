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

ActiveRecord::Schema.define(version: 2021_03_16_043410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "league_memberships", force: :cascade do |t|
    t.bigint "trainer_id"
    t.bigint "league_id"
    t.boolean "league_owner", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_league_memberships_on_league_id"
    t.index ["trainer_id"], name: "index_league_memberships_on_trainer_id"
  end

  create_table "league_settings", force: :cascade do |t|
    t.bigint "league_id"
    t.string "format"
    t.integer "number_of_matchups_a_week"
    t.integer "number_of_teams"
    t.integer "number_of_playoff_teams"
    t.boolean "ev_training_allowed"
    t.boolean "iv_training_allowed"
    t.boolean "duplicate_pokemon_allowed"
    t.boolean "evolution_line_allowed"
    t.boolean "repeat_items_allowed"
    t.integer "weeks_in_a_season"
    t.boolean "trading_allowed"
    t.integer "flex_position_budget"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_league_settings_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "sprite"
    t.string "types", array: true
    t.string "abilities", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "league_id", null: false
    t.string "name"
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "total_wins", default: 0
    t.integer "total_losses", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_trainers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true
  end

end
