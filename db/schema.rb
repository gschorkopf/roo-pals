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

ActiveRecord::Schema.define(version: 20140513202143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schedule_shows", force: true do |t|
    t.integer "schedule_id"
    t.integer "show_id"
  end

  add_index "schedule_shows", ["schedule_id"], name: "index_schedule_shows_on_schedule_id", using: :btree
  add_index "schedule_shows", ["show_id"], name: "index_schedule_shows_on_show_id", using: :btree

  create_table "schedules", force: true do |t|
    t.string "user_name"
    t.string "url"
  end

  create_table "shows", force: true do |t|
    t.string "artist_name"
    t.time   "starting_time"
    t.time   "ending_time"
    t.string "day"
    t.string "location"
  end

  add_index "shows", ["day"], name: "index_shows_on_day", using: :btree
  add_index "shows", ["location"], name: "index_shows_on_location", using: :btree

end
