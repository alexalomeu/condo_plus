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

ActiveRecord::Schema.define(version: 2025_11_05_194311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condominia", force: :cascade do |t|
    t.string "name"
    t.bigint "real_estate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_estate_id"], name: "index_condominia_on_real_estate_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "permissions"
  end

  create_table "real_estates", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact"
    t.string "website"
    t.string "logo"
    t.decimal "total_monetization"
    t.string "responsible_name"
    t.string "responsible_phone"
    t.string "responsible_email"
    t.string "address"
  end

  create_table "responsibles", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "position"
    t.bigint "real_estate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_estate_id"], name: "index_responsibles_on_real_estate_id"
  end

  create_table "revenues", force: :cascade do |t|
    t.bigint "real_estate_id"
    t.bigint "condominium_id"
    t.string "unit"
    t.decimal "negotiated_value"
    t.decimal "monetization"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condominium_id"], name: "index_revenues_on_condominium_id"
    t.index ["real_estate_id"], name: "index_revenues_on_real_estate_id"
  end

  add_foreign_key "condominia", "real_estates"
  add_foreign_key "responsibles", "real_estates"
  add_foreign_key "revenues", "condominia"
  add_foreign_key "revenues", "real_estates"
end
