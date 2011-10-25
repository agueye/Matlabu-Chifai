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

ActiveRecord::Schema.define(:version => 20111022073322) do

  create_table "conditions", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conditions_vaccines", :id => false, :force => true do |t|
    t.integer "condition_id"
    t.integer "vaccine_id"
  end

  create_table "hospitals", :force => true do |t|
    t.integer  "institution_id", :null => false
    t.string   "name",           :null => false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "institutions", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vaccines", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
