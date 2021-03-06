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

ActiveRecord::Schema.define(version: 2020_05_25_105613) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "backer_documents", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "backer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["backer_id"], name: "index_backer_documents_on_backer_id"
    t.index ["document_id"], name: "index_backer_documents_on_document_id"
  end

  create_table "backers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_backers_on_record_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.date "destroy_by_user"
    t.boolean "multiple", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flats", force: :cascade do |t|
    t.string "address"
    t.text "description"
    t.float "monthly_price"
    t.bigint "user_id", null: false
    t.boolean "visible", default: true
    t.boolean "rented", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "number_of_rooms"
    t.integer "number_of_bedrooms"
    t.float "surface"
    t.integer "floor"
    t.boolean "elevator", default: false
    t.boolean "balcony", default: false
    t.boolean "cellar", default: false
    t.boolean "parking", default: false
    t.boolean "furnished", default: false
    t.boolean "pap", default: false
    t.boolean "leboncoin", default: false
    t.boolean "seloger", default: false
    t.boolean "bienici", default: false
    t.string "heating_system", default: [], array: true
    t.boolean "facebook", default: false
    t.string "category"
    t.text "property_advertisement", default: ""
    t.float "latitude"
    t.float "longitude"
    t.date "start_renting_date", default: "2020-05-25"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "flows", force: :cascade do |t|
    t.bigint "renting_id", null: false
    t.datetime "payment_date"
    t.float "amount"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.integer "month_rent"
    t.integer "year_rent"
    t.index ["renting_id"], name: "index_flows_on_renting_id"
  end

  create_table "leases", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "renting_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["renting_id"], name: "index_messages_on_renting_id"
  end

  create_table "record_documents", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_id"], name: "index_record_documents_on_document_id"
    t.index ["record_id"], name: "index_record_documents_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number", default: ""
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "renting_documents", force: :cascade do |t|
    t.bigint "renting_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kind"
    t.index ["document_id"], name: "index_renting_documents_on_document_id"
    t.index ["renting_id"], name: "index_renting_documents_on_renting_id"
  end

  create_table "renting_folders", force: :cascade do |t|
    t.bigint "visit_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["visit_id"], name: "index_renting_folders_on_visit_id"
  end

  create_table "rentings", force: :cascade do |t|
    t.bigint "flat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "ongoing"
    t.date "end_date"
    t.date "start_date"
    t.bigint "renting_folder_id"
    t.string "type_renter"
    t.string "renter"
    t.string "renter_address"
    t.index ["flat_id"], name: "index_rentings_on_flat_id"
    t.index ["renting_folder_id"], name: "index_rentings_on_renting_folder_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.bigint "flat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "booked", default: false
    t.boolean "killed", default: false
    t.index ["flat_id"], name: "index_schedules_on_flat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.text "description"
    t.boolean "remember_me", default: false
    t.boolean "renter", default: true
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.bigint "user_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "people"
    t.float "income"
    t.string "contract"
    t.string "phone"
    t.text "message", default: ""
    t.boolean "renting"
    t.index ["schedule_id"], name: "index_visits_on_schedule_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "backer_documents", "backers"
  add_foreign_key "backer_documents", "documents"
  add_foreign_key "flats", "users"
  add_foreign_key "flows", "rentings"
  add_foreign_key "messages", "rentings"
  add_foreign_key "record_documents", "documents"
  add_foreign_key "record_documents", "records"
  add_foreign_key "records", "users"
  add_foreign_key "renting_documents", "documents"
  add_foreign_key "renting_documents", "rentings"
  add_foreign_key "renting_folders", "visits"
  add_foreign_key "rentings", "flats"
  add_foreign_key "rentings", "renting_folders"
  add_foreign_key "schedules", "flats"
  add_foreign_key "visits", "schedules"
  add_foreign_key "visits", "users"
end
