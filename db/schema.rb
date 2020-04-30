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

ActiveRecord::Schema.define(version: 2020_04_30_150532) do

  create_table "inspectors", force: :cascade do |t|
    t.string "terms"
    t.integer "priority"
    t.date "expiry_date"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inspectors_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "inspector_id", null: false
    t.integer "user_id", null: false
    t.integer "status"
    t.string "signature"
    t.string "source_name"
    t.string "source_url"
    t.integer "relevance"
    t.integer "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inspector_id"], name: "index_notifications_on_inspector_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_offers_on_product_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "maker"
    t.string "brand"
    t.string "model"
    t.integer "stock"
    t.integer "user_id"
    t.date "expiry_date"
    t.date "produced_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "inspectors", "users"
  add_foreign_key "notifications", "inspectors"
  add_foreign_key "notifications", "users"
  add_foreign_key "offers", "products"
  add_foreign_key "offers", "users"
end
