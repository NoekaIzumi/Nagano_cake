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

ActiveRecord::Schema.define(version: 2023_09_24_065649) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "item_id_id", null: false
    t.integer "customer_id_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id_id"], name: "index_cart_items_on_customer_id_id"
    t.index ["item_id_id"], name: "index_cart_items_on_item_id_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.boolean "is_deleted", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oder_items", force: :cascade do |t|
    t.integer "item_id_id", null: false
    t.integer "oder_id_id", null: false
    t.integer "price", null: false
    t.integer "quantitiy", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id_id"], name: "index_oder_items_on_item_id_id"
    t.index ["oder_id_id"], name: "index_oder_items_on_oder_id_id"
  end

  create_table "oders", force: :cascade do |t|
    t.integer "customer_id_id", null: false
    t.string "name", null: false
    t.string "postcode", null: false
    t.string "address", null: false
    t.integer "total_amount", null: false
    t.integer "shipping_fee", null: false
    t.integer "payment_method", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id_id"], name: "index_oders_on_customer_id_id"
  end

  add_foreign_key "cart_items", "customer_ids"
  add_foreign_key "cart_items", "item_ids"
  add_foreign_key "oder_items", "item_ids"
  add_foreign_key "oder_items", "oder_ids"
  add_foreign_key "oders", "customer_ids"
end
