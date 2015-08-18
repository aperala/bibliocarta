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

ActiveRecord::Schema.define(version: 20150818192146) do

  create_table "book_places", id: false, force: :cascade do |t|
    t.integer "book_id",  null: false
    t.integer "place_id", null: false
  end

  add_index "book_places", ["book_id"], name: "index_book_places_on_book_id"
  add_index "book_places", ["place_id"], name: "index_book_places_on_place_id"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.date   "pub_date"
    t.string "genre"
    t.string "format",    default: "pb"
    t.string "publisher"
    t.text   "summary"
    t.string "isbn"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.float  "latitude"
    t.float  "longitude"
  end

  create_table "user_books", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.boolean "read"
  end

  add_index "user_books", ["book_id"], name: "index_user_books_on_book_id"
  add_index "user_books", ["user_id"], name: "index_user_books_on_user_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
