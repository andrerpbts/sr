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

ActiveRecord::Schema.define(:version => 20120925160007) do

  create_table "banners", :force => true do |t|
    t.string   "banner"
    t.integer  "top"
    t.integer  "left"
    t.integer  "width"
    t.string   "height"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "category"
  end

  create_table "configurations", :force => true do |t|
    t.integer  "max_banner_image"
    t.integer  "max_vehicle_image"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "setups", :force => true do |t|
    t.integer  "max_banner_image"
    t.integer  "max_vehicle_image"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sponsors", :force => true do |t|
    t.string   "url"
    t.integer  "banner_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "sponsors", ["banner_id"], :name => "index_sponsors_on_banner_id"

end
