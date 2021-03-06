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

ActiveRecord::Schema.define(version: 20171221193015) do

  create_table "items", force: :cascade do |t|
    t.string "content"
    t.integer "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct", default: false
    t.index ["poll_id"], name: "index_items_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string "content"
    t.integer "presentation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "response_type", default: 1
    t.integer "feedback_type", default: 1
    t.index ["presentation_id"], name: "index_polls_on_presentation_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "broadcasting", default: false
    t.integer "current_slide", default: 0
    t.index ["user_id"], name: "index_presentations_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "written"
    t.index ["item_id"], name: "index_responses_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
