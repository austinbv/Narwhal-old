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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111125233537) do

  create_table "presentations", :force => true do |t|
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "collaberation_on", :default => true
    t.integer  "creator_id"
  end

  create_table "presentations_users", :force => true do |t|
    t.integer "user_id"
    t.integer "presentation_id"
  end

  create_table "shapes", :force => true do |t|
    t.integer  "slide_id"
    t.string   "shape_type"
    t.integer  "stroke_width"
    t.string   "stroke_color"
    t.string   "fill_color"
    t.integer  "height"
    t.integer  "width"
    t.integer  "radius"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "points"
    t.string   "hash"
  end

  create_table "slides", :force => true do |t|
    t.integer  "presentation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "google_uid"
    t.text     "avatar_url"
  end

end
