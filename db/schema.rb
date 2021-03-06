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

ActiveRecord::Schema.define(version: 2021_11_20_083446) do

  create_table "action_text_rich_texts", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assign_supporting_docs", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "support_request_id", null: false
    t.bigint "super_admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["super_admin_id"], name: "index_assign_supporting_docs_on_super_admin_id"
    t.index ["support_request_id"], name: "index_assign_supporting_docs_on_support_request_id"
    t.index ["user_id"], name: "index_assign_supporting_docs_on_user_id"
  end

  create_table "delayed_jobs", charset: "utf8mb3", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "document_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "support_request_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "support_requests", charset: "utf8mb3", force: :cascade do |t|
    t.string "req_type", limit: 50
    t.text "details"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "closed"
    t.integer "updated_by_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "support_request_type_id", null: false
    t.index ["support_request_type_id"], name: "index_support_requests_on_support_request_type_id"
    t.index ["updated_by_id"], name: "index_support_requests_on_updated_by_id"
    t.index ["user_id"], name: "index_support_requests_on_user_id"
  end

  create_table "user_docs", charset: "utf8mb3", force: :cascade do |t|
    t.string "doc_type", limit: 50
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "document_type_id", null: false
    t.index ["document_type_id"], name: "index_user_docs_on_document_type_id"
    t.index ["user_id"], name: "index_user_docs_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "phone", limit: 20
    t.string "emergency_contact_name", limit: 60
    t.string "emergency_contact_phone", limit: 20
    t.float "earnings"
    t.boolean "deactivated"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
