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

ActiveRecord::Schema.define(version: 20180518030553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "description"
    t.string "cover"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.boolean "borrowed", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_events_on_book_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.float "rating"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.string "nickName"
    t.string "avatarUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact"
    t.integer "gender"
    t.string "country"
    t.string "province"
    t.string "city"
  end

  add_foreign_key "books", "users"
  add_foreign_key "events", "books"
  add_foreign_key "events", "users"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "users"
end
