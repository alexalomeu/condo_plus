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

ActiveRecord::Schema.define(version: 2025_11_07_194433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condominiums", force: :cascade do |t|
    t.bigint "real_estate_id", null: false
    t.string "nome", null: false
    t.integer "unidades_por_torre", null: false
    t.text "nomes_torres"
    t.string "tipo"
    t.date "data_construcao"
    t.float "area_total"
    t.float "area_comum"
    t.decimal "valor_condominio", precision: 10, scale: 2
    t.decimal "taxa_administrativa", precision: 10, scale: 2
    t.string "endereco"
    t.string "numero"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "cep"
    t.float "latitude"
    t.float "longitude"
    t.boolean "piscina", default: false
    t.boolean "churrasqueira", default: false
    t.boolean "playground", default: false
    t.boolean "academia", default: false
    t.integer "estacionamento_coberto", default: 0
    t.integer "estacionamento_descoberto", default: 0
    t.boolean "portaria_24h", default: false
    t.integer "elevadores", default: 0
    t.string "email_administracao"
    t.string "telefone_administracao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pendente"
    t.index ["real_estate_id"], name: "index_condominiums_on_real_estate_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "condominium_id"
    t.string "unit"
    t.string "tower"
    t.decimal "negotiated_value", precision: 15, scale: 2
    t.decimal "monetization", precision: 15, scale: 2
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condominium_id"], name: "index_revenues_on_condominium_id"
  end

  add_foreign_key "condominiums", "real_estates"
  add_foreign_key "responsibles", "real_estates"
  add_foreign_key "revenues", "condominiums"
end
