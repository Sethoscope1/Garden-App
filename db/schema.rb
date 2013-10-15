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

ActiveRecord::Schema.define(:version => 20131015142616) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "note_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "text"
  end

  add_index "comments", ["note_id"], :name => "index_comments_on_note_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

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
    t.integer  "list_id"
    t.integer  "user_id"
    t.string   "comments"
    t.integer  "note_id"
    t.integer  "zip"
  end

  add_index "crops", ["name"], :name => "index_crops_on_name"
  add_index "crops", ["zip"], :name => "index_crops_on_zip"

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
    t.integer  "zip"
  end

  add_index "gardens", ["zip"], :name => "index_gardens_on_zip"

  create_table "lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "garden_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "lists", ["garden_id"], :name => "index_lists_on_garden_id"
  add_index "lists", ["user_id"], :name => "index_lists_on_creator_id"

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
    t.integer  "list_id"
    t.date     "due_date"
    t.boolean  "completion"
    t.boolean  "flag1"
    t.boolean  "flag2"
    t.boolean  "flag3"
    t.boolean  "flag4"
    t.boolean  "flag5"
    t.integer  "assigned_user"
  end

  add_index "notes", ["crop_id"], :name => "index_notes_on_crop_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "notifications", :force => true do |t|
    t.integer  "note_id"
    t.integer  "user_id"
    t.date     "due"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "notifications", ["note_id"], :name => "index_notifications_on_note_id"
  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "token"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "zip"
    t.string   "email"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["zip"], :name => "index_users_on_zip"

end
