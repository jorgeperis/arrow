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

ActiveRecord::Schema[8.0].define(version: 2025_01_18_190018) do
  create_table "montly_distances", force: :cascade do |t|
    t.integer "shoes_id", null: false
    t.date "month", null: false
    t.integer "distance", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoes_id", "month"], name: "index_montly_distances_on_shoes_id_and_month", unique: true
    t.index ["shoes_id"], name: "index_montly_distances_on_shoes_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.integer "distance", null: false
    t.boolean "homologated", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "distance", "location"], name: "index_races_on_name_and_distance_and_location", unique: true
  end

  create_table "rans", force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "edition"
    t.date "date", null: false
    t.integer "distance", null: false
    t.boolean "homologated", default: false, null: false
    t.integer "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source", default: "chip", null: false
    t.index ["race_id", "edition"], name: "index_rans_on_race_id_and_edition", unique: true
    t.index ["race_id"], name: "index_rans_on_race_id"
  end

  create_table "shoes", force: :cascade do |t|
    t.string "brand", null: false
    t.string "model", null: false
    t.float "size", null: false
    t.date "purchased_at", null: false
    t.integer "distance", default: 0, null: false
    t.float "price"
    t.date "retired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "montly_distances", "shoes", column: "shoes_id"
  add_foreign_key "rans", "races"
end
