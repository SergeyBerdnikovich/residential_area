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

ActiveRecord::Schema.define(:version => 20121217123453) do

  create_table "apartments", :force => true do |t|
    t.integer  "house_id"
    t.string   "title"
    t.string   "description"
    t.integer  "cost"
    t.integer  "space"
    t.integer  "number_of_rooms"
    t.boolean  "residential"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "apartments", ["house_id"], :name => "index_apartments_on_house_id"

  create_table "galleries", :force => true do |t|
    t.integer  "house_id"
    t.integer  "apartment_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "galleries", ["apartment_id"], :name => "index_galleries_on_apartment_id"
  add_index "galleries", ["house_id"], :name => "index_galleries_on_house_id"

  create_table "heads", :force => true do |t|
    t.string   "full_name"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "houses", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "completed"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "house_id"
    t.integer  "head_id"
    t.integer  "partner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "gmaps"
    t.string   "name"
  end

  add_index "locations", ["head_id"], :name => "index_locations_on_head_id"
  add_index "locations", ["house_id"], :name => "index_locations_on_house_id"
  add_index "locations", ["partner_id"], :name => "index_locations_on_partner_id"

  create_table "partners", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "number"
    t.integer  "head_id"
    t.integer  "partner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phone_numbers", ["head_id"], :name => "index_phone_numbers_on_head_id"
  add_index "phone_numbers", ["partner_id"], :name => "index_phone_numbers_on_partner_id"

end
