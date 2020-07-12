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

ActiveRecord::Schema.define(version: 2020_07_07_183009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Products", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "maker_name", limit: 255
    t.string "brand", limit: 255
    t.string "model", limit: 255
    t.datetime "produced_date"
    t.datetime "expiry_date"
    t.integer "stock"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "user_id"
  end

  create_table "SequelizeMeta", primary_key: "name", id: :string, limit: 255, force: :cascade do |t|
  end

  create_table "Users", id: :serial, force: :cascade do |t|
    t.string "firstName", limit: 255
    t.string "lastName", limit: 255
    t.string "email", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "accommodations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "status", default: 0
    t.integer "relevance", default: 0
    t.boolean "banned", default: false
    t.decimal "price", precision: 10, scale: 2
    t.integer "main_image_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.index ["latitude", "longitude"], name: "index_accommodations_on_latitude_and_longitude"
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attractions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "features", array: true
    t.integer "activities", array: true
    t.string "hash_tags", array: true
    t.json "languages"
    t.integer "status", default: 0
    t.boolean "banned", default: false
    t.string "subdomain_name"
    t.integer "relevance", default: 0
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.index ["latitude", "longitude"], name: "index_attractions_on_latitude_and_longitude"
    t.index ["user_id"], name: "index_attractions_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "parent_category_id"
    t.string "name"
    t.string "page_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_offers", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categories_offers_on_category_id"
    t.index ["offer_id"], name: "index_categories_offers_on_offer_id"
  end

  create_table "categories_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categories_products_on_category_id"
    t.index ["product_id"], name: "index_categories_products_on_product_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.text "text"
    t.string "describable_type", null: false
    t.bigint "describable_id", null: false
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["describable_type", "describable_id"], name: "index_descriptions_on_describable_type_and_describable_id"
  end

  create_table "inspectors", force: :cascade do |t|
    t.string "terms"
    t.integer "priority"
    t.date "expiry_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inspectors_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "inspector_id", null: false
    t.bigint "user_id", null: false
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
    t.bigint "user_id"
    t.bigint "product_id"
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", precision: 10, scale: 2
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
    t.bigint "user_id"
    t.date "expiry_date"
    t.date "produced_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "country_code"
    t.string "name"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "accommodation_id", null: false
    t.integer "room_number", default: 0
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accommodation_id"], name: "index_rooms_on_accommodation_id"
  end

  create_table "static_images", force: :cascade do |t|
    t.string "page_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "static_texts", force: :cascade do |t|
    t.string "text"
    t.string "language"
    t.string "page_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taxis", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.string "brand"
    t.string "model"
    t.string "year_built"
    t.integer "passengers_count"
    t.decimal "hour_price", precision: 10, scale: 2
    t.decimal "day_price", precision: 10, scale: 2
    t.decimal "hour_price_wo_driver", precision: 10, scale: 2
    t.decimal "day_price_wo_driver", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.index ["latitude", "longitude"], name: "index_taxis_on_latitude_and_longitude"
    t.index ["user_id"], name: "index_taxis_on_user_id"
  end

  create_table "tour_days", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.integer "day_number"
    t.string "tittle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tour_days_on_tour_id"
  end

  create_table "tour_excludes", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tour_excludes_on_tour_id"
  end

  create_table "tour_includes", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tour_includes_on_tour_id"
  end

  create_table "tour_plus", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tour_plus_on_tour_id"
  end

  create_table "tour_suplements", force: :cascade do |t|
    t.bigint "tour_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tour_suplements_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.string "duration_unit"
    t.integer "status"
    t.integer "price_adults"
    t.integer "price_kids"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.index ["latitude", "longitude"], name: "index_tours_on_latitude_and_longitude"
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "taxi_id", null: false
    t.integer "from"
    t.integer "to"
    t.decimal "adult_price", precision: 10, scale: 2
    t.decimal "child_price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["taxi_id"], name: "index_transfers_on_taxi_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "accommodations", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attractions", "users"
  add_foreign_key "categories_offers", "categories"
  add_foreign_key "categories_offers", "offers"
  add_foreign_key "categories_products", "categories"
  add_foreign_key "categories_products", "products"
  add_foreign_key "inspectors", "users"
  add_foreign_key "notifications", "inspectors"
  add_foreign_key "notifications", "users"
  add_foreign_key "offers", "products"
  add_foreign_key "offers", "users"
  add_foreign_key "rooms", "accommodations"
  add_foreign_key "taxis", "users"
  add_foreign_key "tour_days", "tours"
  add_foreign_key "tour_excludes", "tours"
  add_foreign_key "tour_includes", "tours"
  add_foreign_key "tour_plus", "tours"
  add_foreign_key "tour_suplements", "tours"
  add_foreign_key "tours", "users"
  add_foreign_key "transfers", "taxis"
end
