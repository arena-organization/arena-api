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

ActiveRecord::Schema.define(version: 2023_08_29_152638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_establishments", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "establishment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_establishments_on_client_id"
    t.index ["establishment_id"], name: "index_client_establishments_on_establishment_id"
  end

  create_table "courts", force: :cascade do |t|
    t.bigint "establishment_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["establishment_id"], name: "index_courts_on_establishment_id"
  end

  create_table "establishments", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.text "description"
    t.string "foundation_date"
    t.string "address"
    t.string "phone"
    t.time "open_at"
    t.time "closed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_establishments_on_owner_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "owner_id"
    t.datetime "date_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "court_id"
    t.index ["court_id"], name: "index_matches_on_court_id"
    t.index ["owner_id"], name: "index_matches_on_owner_id"
  end

  create_table "player_matches", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_player_matches_on_match_id"
    t.index ["player_id"], name: "index_player_matches_on_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "email", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.time "birthdate"
    t.integer "role", default: 0, null: false
    t.string "zip_code"
    t.string "city"
    t.string "region"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "client_establishments", "establishments"
  add_foreign_key "client_establishments", "users", column: "client_id"
  add_foreign_key "courts", "establishments"
  add_foreign_key "establishments", "users", column: "owner_id"
  add_foreign_key "matches", "courts"
  add_foreign_key "matches", "users", column: "owner_id"
  add_foreign_key "player_matches", "matches"
  add_foreign_key "player_matches", "users", column: "player_id"
end
