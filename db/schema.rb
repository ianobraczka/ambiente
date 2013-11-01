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

ActiveRecord::Schema.define(:version => 20131101135953) do

  create_table "areas", :force => true do |t|
    t.integer  "enterprise_id"
    t.string   "name"
    t.float    "price"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "weight"
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

  create_table "periods", :force => true do |t|
    t.integer  "planning_id"
    t.float    "quantity"
    t.float    "planned_quantity"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "plannings", :force => true do |t|
    t.integer  "system_id"
    t.integer  "subsystem_id"
    t.integer  "subsubsystem_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "plannable_type"
    t.integer  "plannable_id"
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "weight"
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
    t.float    "price"
    t.float    "total_quantity"
    t.string   "unity"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "weight"
  end

  create_table "subsystems", :force => true do |t|
    t.integer  "system_id"
    t.string   "name"
    t.float    "price"
    t.float    "total_quantity"
    t.string   "unity"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "weight"
  end

  create_table "systems", :force => true do |t|
    t.integer  "area_id"
    t.integer  "subarea_id"
    t.integer  "local_id"
    t.string   "name"
    t.float    "price"
    t.float    "total_quantity"
    t.string   "unity"
    t.integer  "hh"
    t.integer  "percentage"
    t.float    "value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "has_desagragations"
    t.integer  "enterprise_id"
    t.integer  "weight"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.boolean  "editor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
