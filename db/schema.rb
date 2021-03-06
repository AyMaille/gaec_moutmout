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

ActiveRecord::Schema.define(version: 2022_01_24_154646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.bigint "sheep_id", null: false
    t.string "name"
    t.string "type"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sheep_id"], name: "index_acts_on_sheep_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.string "user_name"
    t.text "content"
    t.bigint "sheep_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sheep_id"], name: "index_comments_on_sheep_id"
  end

  create_table "corner_positions", force: :cascade do |t|
    t.bigint "field_id", null: false
    t.float "long"
    t.float "lat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_corner_positions_on_field_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lots", force: :cascade do |t|
    t.bigint "field_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "user_id"
    t.index ["field_id"], name: "index_lots_on_field_id"
    t.index ["user_id"], name: "index_lots_on_user_id"
  end

  create_table "ownings", force: :cascade do |t|
    t.bigint "field_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_ownings_on_field_id"
    t.index ["user_id"], name: "index_ownings_on_user_id"
  end

  create_table "sheep", force: :cascade do |t|
    t.string "genre"
    t.integer "age"
    t.float "weight"
    t.bigint "field_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "pregnant"
    t.integer "expected_lambs"
    t.string "kind"
    t.integer "mother_id"
    t.string "status"
    t.bigint "lot_id"
    t.bigint "electronic_id"
    t.index ["field_id"], name: "index_sheep_on_field_id"
    t.index ["lot_id"], name: "index_sheep_on_lot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "acts", "sheep"
  add_foreign_key "comments", "sheep"
  add_foreign_key "corner_positions", "fields"
  add_foreign_key "lots", "fields"
  add_foreign_key "lots", "users"
  add_foreign_key "ownings", "fields"
  add_foreign_key "ownings", "users"
  add_foreign_key "sheep", "fields"
  add_foreign_key "sheep", "lots"
end
