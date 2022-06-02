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

ActiveRecord::Schema[7.0].define(version: 2022_05_31_140728) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carrier_managements", force: :cascade do |t|
    t.string "fancy_name"
    t.string "social_reason"
    t.string "domain_of_emails"
    t.string "cnpj"
    t.string "billing_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "carrier_situation"
    t.integer "status", default: 0
  end

  create_table "deadlines", force: :cascade do |t|
    t.integer "days_delivery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "minimum_of_days"
    t.float "minimum_distance"
    t.float "maximum_distance"
    t.integer "carrier_management_id", null: false
    t.index ["carrier_management_id"], name: "index_deadlines_on_carrier_management_id"
  end

  create_table "delivery_prices", force: :cascade do |t|
    t.float "km_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "initial_price"
    t.float "smaller_volume"
    t.float "larger_volume"
    t.float "larger_weight"
    t.float "smaller_weight"
    t.integer "carrier_management_id", default: 0, null: false
    t.index ["carrier_management_id"], name: "index_delivery_prices_on_carrier_management_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "full_address"
    t.string "product_code"
    t.float "volume"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_queries", force: :cascade do |t|
    t.float "volume_query"
    t.float "weight_query"
    t.float "distance_query"
    t.float "delivery_price_query"
    t.string "carrier_disponible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_deliveries", force: :cascade do |t|
    t.string "vehicle_plate"
    t.string "brand_vehicle"
    t.string "model_vehicle"
    t.string "maximum_load_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_management_id", null: false
    t.integer "year_of_manufacture"
    t.index ["carrier_management_id"], name: "index_vehicle_deliveries_on_carrier_management_id"
  end

  add_foreign_key "deadlines", "carrier_managements"
  add_foreign_key "delivery_prices", "carrier_managements"
  add_foreign_key "vehicle_deliveries", "carrier_managements"
end
