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

ActiveRecord::Schema.define(version: 2020_12_22_155319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accom_complements", force: :cascade do |t|
    t.string "label"
    t.string "icon_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.bigint "region_id"
    t.string "address"
    t.integer "double_beds", default: 0
    t.integer "single_beds", default: 0
    t.integer "bunked_beds", default: 0
    t.integer "baby_beds", default: 0
    t.decimal "high_season_price", precision: 10, scale: 2
    t.decimal "low_season_price", precision: 10, scale: 2
    t.integer "included_services", default: [], array: true
    t.integer "excluded_services", default: [], array: true
    t.integer "rent_mode", default: 0
    t.index ["latitude", "longitude"], name: "index_accommodations_on_latitude_and_longitude"
    t.index ["region_id"], name: "index_accommodations_on_region_id"
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "accommodations_amenities", force: :cascade do |t|
    t.bigint "accommodation_id", null: false
    t.bigint "amenity_id", null: false
    t.index ["accommodation_id"], name: "index_accommodations_amenities_on_accommodation_id"
    t.index ["amenity_id"], name: "index_accommodations_amenities_on_amenity_id"
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

  create_table "amenities", force: :cascade do |t|
    t.string "label"
    t.string "icon_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["label"], name: "index_amenities_on_label", unique: true
  end

  create_table "attract_activities", force: :cascade do |t|
    t.string "label"
    t.string "icon_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attract_types", force: :cascade do |t|
    t.string "label"
    t.string "icon_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.bigint "region_id"
    t.string "address"
    t.index ["latitude", "longitude"], name: "index_attractions_on_latitude_and_longitude"
    t.index ["region_id"], name: "index_attractions_on_region_id"
    t.index ["user_id"], name: "index_attractions_on_user_id"
  end

  create_table "attractions_attract_activities", force: :cascade do |t|
    t.bigint "attraction_id", null: false
    t.bigint "attract_activity_id", null: false
    t.index ["attract_activity_id"], name: "index_attractions_attract_activities_on_attract_activity_id"
    t.index ["attraction_id"], name: "index_attractions_attract_activities_on_attraction_id"
  end

  create_table "attractions_attract_types", force: :cascade do |t|
    t.bigint "attraction_id", null: false
    t.bigint "attract_type_id", null: false
    t.index ["attract_type_id"], name: "index_attractions_attract_types_on_attract_type_id"
    t.index ["attraction_id"], name: "index_attractions_attract_types_on_attraction_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "parent_category_id"
    t.string "name"
    t.string "page_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id"
    t.index ["shop_id"], name: "index_categories_on_shop_id"
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
    t.bigint "shop_id"
    t.index ["product_id"], name: "index_offers_on_product_id"
    t.index ["shop_id"], name: "index_offers_on_shop_id"
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
    t.bigint "shop_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
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

  create_table "room_amenities", force: :cascade do |t|
    t.string "label"
    t.string "icon_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "accommodation_id", null: false
    t.integer "room_number", default: 0
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "high_season_price", precision: 10, scale: 2
    t.decimal "low_season_price", precision: 10, scale: 2
    t.integer "double_beds"
    t.integer "single_beds"
    t.integer "bunked_beds"
    t.integer "baby_beds"
    t.index ["accommodation_id"], name: "index_rooms_on_accommodation_id"
  end

  create_table "rooms_room_amenities", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "room_amenity_id", null: false
    t.index ["room_amenity_id"], name: "index_rooms_room_amenities_on_room_amenity_id"
    t.index ["room_id"], name: "index_rooms_room_amenities_on_room_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "uid", limit: 64
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["uid"], name: "index_shops_on_uid", unique: true
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "static_images", force: :cascade do |t|
    t.string "page_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id"
    t.index ["shop_id"], name: "index_static_images_on_shop_id"
  end

  create_table "static_texts", force: :cascade do |t|
    t.string "text"
    t.string "language"
    t.string "page_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id"
    t.index ["shop_id"], name: "index_static_texts_on_shop_id"
  end

  create_table "taxi_amenities", force: :cascade do |t|
    t.string "label"
    t.string "icon_name"
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

  create_table "taxis_taxi_amenities", force: :cascade do |t|
    t.bigint "taxi_id", null: false
    t.bigint "taxi_amenity_id", null: false
    t.index ["taxi_amenity_id"], name: "index_taxis_taxi_amenities_on_taxi_amenity_id"
    t.index ["taxi_id"], name: "index_taxis_taxi_amenities_on_taxi_id"
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
    t.integer "min_participant", default: 1
    t.integer "max_participant"
    t.string "topics", array: true
    t.boolean "paid_tour", default: true
    t.string "currency"
    t.boolean "hours_tour", default: true
    t.string "hours_range"
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
    t.string "uid"
    t.string "preferred_language"
    t.string "notification_token"
    t.index ["uid"], name: "index_users_on_uid"
  end

  add_foreign_key "accommodations", "regions"
  add_foreign_key "accommodations", "users"
  add_foreign_key "accommodations_amenities", "accommodations"
  add_foreign_key "accommodations_amenities", "amenities"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attractions", "regions"
  add_foreign_key "attractions", "users"
  add_foreign_key "attractions_attract_activities", "attract_activities"
  add_foreign_key "attractions_attract_activities", "attractions"
  add_foreign_key "attractions_attract_types", "attract_types"
  add_foreign_key "attractions_attract_types", "attractions"
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
  add_foreign_key "rooms_room_amenities", "room_amenities"
  add_foreign_key "rooms_room_amenities", "rooms"
  add_foreign_key "taxis", "users"
  add_foreign_key "taxis_taxi_amenities", "taxi_amenities"
  add_foreign_key "taxis_taxi_amenities", "taxis"
  add_foreign_key "tour_days", "tours"
  add_foreign_key "tour_excludes", "tours"
  add_foreign_key "tour_includes", "tours"
  add_foreign_key "tour_plus", "tours"
  add_foreign_key "tour_suplements", "tours"
  add_foreign_key "tours", "users"
  add_foreign_key "transfers", "taxis"
end
