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

ActiveRecord::Schema[7.0].define(version: 2025_04_27_064023) do
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

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_promotion_code", default: false, null: false
  end

  create_table "checkout_products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "description"
    t.string "category", null: false
    t.integer "quantity", null: false
    t.bigint "checkout_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkout_id"], name: "index_checkout_products_on_checkout_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "address", null: false
    t.string "address2"
    t.string "email"
    t.integer "country", null: false
    t.integer "prefecture_id", null: false
    t.string "zip", null: false
    t.boolean "is_same_address", default: false, null: false
    t.boolean "is_save", default: false, null: false
    t.string "name_on_card", null: false
    t.string "credit_card_number", null: false
    t.string "expiration", null: false
    t.integer "cvv", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id", "created_at"], name: "index_checkouts_on_cart_id_and_created_at"
    t.index ["cart_id"], name: "index_checkouts_on_cart_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_items_on_cart_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "description"
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock"
    t.index ["category", "created_at"], name: "index_products_on_category_and_created_at"
  end

  create_table "promotion_codes", force: :cascade do |t|
    t.string "code", null: false
    t.integer "discount_amount", null: false
    t.bigint "cart_id"
    t.bigint "checkout_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_promotion_codes_on_cart_id"
    t.index ["checkout_product_id"], name: "index_promotion_codes_on_checkout_product_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "checkout_products", "checkouts"
  add_foreign_key "checkouts", "carts"
  add_foreign_key "items", "carts"
  add_foreign_key "items", "products"
end
