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

ActiveRecord::Schema.define(version: 2019_05_20_125048) do

  create_table "lanes", force: :cascade do |t|
  end

  create_table "memories", force: :cascade do |t|
    t.string "title"
    t.datetime "date"
    t.string "location"
    t.integer "lane_id"
    t.integer "creator_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "file_path"
    t.string "caption"
    t.integer "user_id"
    t.integer "memory_id"
  end

  create_table "recollections", force: :cascade do |t|
    t.string "anecdote"
    t.string "quote"
    t.string "joke"
    t.integer "user_id"
    t.integer "memory_id"
  end

  create_table "user_lanes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lane_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "profile_pic_file_path"
  end

end
