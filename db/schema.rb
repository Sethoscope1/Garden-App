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

ActiveRecord::Schema.define(:version => 20131008212007) do

  create_table "crops", :force => true do |t|
    t.string   "name"
    t.string   "variant"
    t.date     "plant_date"
    t.date     "harvest_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "garden_id"
    t.date     "to_plant_date"
    t.date     "to_harvest_date"
  end

  add_index "crops", ["name"], :name => "index_crops_on_name"

  create_table "garden_memberships", :force => true do |t|
    t.integer  "garden_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gardens", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "crop_id"
    t.text     "text"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "title"
    t.string   "note_photo_file_name"
    t.string   "note_photo_content_type"
    t.integer  "note_photo_file_size"
    t.datetime "note_photo_updated_at"
  end

  add_index "notes", ["crop_id"], :name => "index_notes_on_crop_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "token"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
