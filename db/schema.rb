# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151226154822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_places", force: :cascade do |t|
    t.integer "book_id",  null: false
    t.integer "place_id", null: false
  end

  add_index "book_places", ["book_id"], name: "index_book_places_on_book_id", using: :btree
  add_index "book_places", ["place_id"], name: "index_book_places_on_place_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "genre"
    t.text     "summary"
    t.string   "isbn"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "installs", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "installs", ["email"], name: "index_installs_on_email", unique: true, using: :btree
  add_index "installs", ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true, using: :btree

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.float  "latitude"
    t.float  "longitude"
  end

  create_table "user_books", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.boolean "read"
  end

  add_index "user_books", ["book_id"], name: "index_user_books_on_book_id", using: :btree
  add_index "user_books", ["user_id"], name: "index_user_books_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.string   "location"
    t.boolean  "curator",                default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
