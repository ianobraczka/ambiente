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

ActiveRecord::Schema.define(:version => 20140206191941) do

  create_table "areas", :force => true do |t|
    t.integer  "enterprise_id"
    t.string   "name"
    t.float    "price"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "weight"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "areas_systems", :id => false, :force => true do |t|
    t.integer "area_id"
    t.integer "system_id"
  end

  create_table "baselines", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "date"
    t.string   "comment"
  end

  create_table "enterprises", :force => true do |t|
    t.integer  "program_id"
    t.string   "name"
    t.float    "price"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "weight"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imagiable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "locals", :force => true do |t|
    t.integer  "subarea_id"
    t.string   "name"
    t.float    "price"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "media", :force => true do |t|
    t.integer  "mediable_id"
    t.string   "mediable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "periods", :force => true do |t|
    t.integer  "planning_id"
    t.float    "quantity"
    t.float    "planned_quantity"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "number"
    t.float    "real_quantity"
  end

  create_table "plannings", :force => true do |t|
    t.integer  "system_id"
    t.integer  "subsystem_id"
    t.integer  "subsubsystem_id"
    t.date     "period_begin"
    t.date     "period_end"
    t.float    "quantity"
    t.float    "planned_quantity"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "plannable_type"
    t.integer  "plannable_id"
    t.date     "init_date"
    t.date     "input_date"
    t.boolean  "editable",         :default => true
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "weight"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "subareas", :force => true do |t|
    t.integer  "area_id"
    t.string   "name"
    t.float    "price"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subsubsystems", :force => true do |t|
    t.integer  "subsystem_id"
    t.string   "name"
    t.float    "price",               :default => 0.0
    t.float    "total_quantity"
    t.string   "unity"
    t.integer  "hh",                  :default => 0
    t.integer  "percentage",          :default => 0
    t.float    "value",               :default => 0.0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "weight"
    t.integer  "current_planning_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "subsystems", :force => true do |t|
    t.integer  "system_id"
    t.string   "name"
    t.float    "price",               :default => 0.0
    t.float    "total_quantity"
    t.string   "unity"
    t.integer  "hh",                  :default => 0
    t.integer  "percentage",          :default => 0
    t.float    "value",               :default => 0.0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "weight",              :default => 0
    t.integer  "current_planning_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "systems", :force => true do |t|
    t.integer  "area_id"
    t.integer  "subarea_id"
    t.integer  "local_id"
    t.string   "name"
    t.float    "price",               :default => 0.0
    t.float    "total_quantity"
    t.string   "unity"
    t.integer  "hh",                  :default => 0
    t.integer  "percentage",          :default => 0
    t.float    "value",               :default => 0.0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "has_desagragations"
    t.integer  "enterprise_id"
    t.integer  "weight",              :default => 0
    t.integer  "current_planning_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
