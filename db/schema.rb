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

ActiveRecord::Schema[7.0].define(version: 16) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "diseases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "start_time"
    t.date "end_time"
    t.string "certificate"
    t.text "note"
    t.boolean "processed"
    t.string "updater"
    t.string "creator"
    t.date "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diseases_on_user_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "start_time"
    t.date "end_time"
    t.text "note"
    t.boolean "processed"
    t.string "updater"
    t.string "creator"
    t.date "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_holidays_on_user_id"
  end

  create_table "hourly_holidays", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "note"
    t.boolean "processed"
    t.string "updater"
    t.string "creator"
    t.date "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hourly_holidays_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reasons", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refund_closures", force: :cascade do |t|
    t.string "year_reference"
    t.string "month_reference"
    t.string "period_reference"
    t.boolean "payed"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_refund_closures_on_user_id"
  end

  create_table "refunds", force: :cascade do |t|
    t.integer "refund_number"
    t.date "departure_date"
    t.date "return_date"
    t.date "request_date"
    t.date "refund_date"
    t.decimal "parking_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "food_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "room_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "ticket_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "generic_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "total_amount", precision: 8, scale: 2, default: "0.0"
    t.integer "user_id"
    t.integer "reason_id"
    t.integer "road_id"
    t.integer "place_id"
    t.integer "structure_id"
    t.integer "transport_id"
    t.integer "veichle_id"
    t.string "user_fr"
    t.string "reason_fr"
    t.string "road_fr"
    t.string "place_fr"
    t.string "structure_fr"
    t.string "transport_fr"
    t.string "veichle_fr"
    t.decimal "highway_cost_fr", precision: 8, scale: 2, default: "0.0"
    t.decimal "road_lenght_fr", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roads", force: :cascade do |t|
    t.string "name"
    t.decimal "road_lenght", precision: 8, scale: 2, default: "0.0"
    t.decimal "highway_cost", precision: 8, scale: 2, default: "0.0"
    t.integer "position"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.bigint "position"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.string "region"
    t.string "province"
    t.string "category"
    t.string "institute"
    t.string "office"
    t.string "validator"
    t.string "validator_presentation"
    t.decimal "cost_per_km", precision: 8, scale: 2, default: "0.0"
    t.boolean "god"
    t.boolean "admin"
    t.boolean "manager"
    t.boolean "regular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "signature"
    t.string "validator_signature"
    t.string "organizational_signature"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "veichles", force: :cascade do |t|
    t.string "name"
    t.string "producer"
    t.string "license_plate"
    t.integer "position"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "diseases", "users"
  add_foreign_key "holidays", "users"
  add_foreign_key "hourly_holidays", "users"
  add_foreign_key "refund_closures", "users"
end
