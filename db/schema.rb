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

ActiveRecord::Schema[8.0].define(version: 2025_02_16_104415) do
  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "gender", null: false
    t.integer "mother_id"
    t.integer "father_id"
    t.integer "spouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["father_id"], name: "index_people_on_father_id"
    t.index ["mother_id"], name: "index_people_on_mother_id"
    t.index ["name"], name: "index_people_on_name", unique: true
    t.index ["spouse_id"], name: "index_people_on_spouse_id"
  end

  add_foreign_key "people", "people", column: "father_id"
  add_foreign_key "people", "people", column: "mother_id"
  add_foreign_key "people", "people", column: "spouse_id"
end
