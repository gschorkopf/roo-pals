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

ActiveRecord::Schema.define(version: 20140601232948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "schedule_shows", force: true do |t|
    t.integer "schedule_id"
    t.integer "show_id"
  end

  add_index "schedule_shows", ["schedule_id"], name: "index_schedule_shows_on_schedule_id", using: :btree
  add_index "schedule_shows", ["show_id"], name: "index_schedule_shows_on_show_id", using: :btree

  create_table "schedules", force: true do |t|
    t.string  "profile_name"
    t.integer "user_id"
  end

  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "shows", force: true do |t|
    t.string   "artist_name"
    t.string   "day"
    t.string   "location"
    t.datetime "starting_at"
    t.datetime "ending_at"
    t.integer  "schedules_count", default: 0, null: false
  end

  add_index "shows", ["day"], name: "index_shows_on_day", using: :btree
  add_index "shows", ["location"], name: "index_shows_on_location", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
  end

end
