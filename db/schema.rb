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

ActiveRecord::Schema.define(version: 2020_09_15_061514) do

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

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.string "stripe_customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.boolean "display"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_date"
    t.integer "duration"
    t.string "title"
    t.text "description"
    t.integer "price"
    t.string "location"
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["village_id"], name: "index_events_on_village_id"
  end

  create_table "forum_posts", force: :cascade do |t|
    t.string "content"
    t.bigint "villager_id"
    t.bigint "forum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_forum_posts_on_forum_id"
    t.index ["villager_id"], name: "index_forum_posts_on_villager_id"
  end

  create_table "forums", force: :cascade do |t|
    t.string "title"
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["village_id"], name: "index_forums_on_village_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "type_of_offer"
    t.text "description"
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["village_id"], name: "index_offers_on_village_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "town_halls", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_town_halls_on_email", unique: true
    t.index ["reset_password_token"], name: "index_town_halls_on_reset_password_token", unique: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "villagers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.datetime "date_of_birth"
    t.bigint "village_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_villagers_on_user_id"
    t.index ["village_id"], name: "index_villagers_on_village_id"
  end

  create_table "villages", force: :cascade do |t|
    t.string "name"
    t.string "zipcode"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "forum_posts", "forums"
  add_foreign_key "forum_posts", "villagers"
  add_foreign_key "forums", "villages"
  add_foreign_key "villagers", "users"
  add_foreign_key "villagers", "villages"
end
