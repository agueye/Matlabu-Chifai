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

ActiveRecord::Schema.define(:version => 20111106045726) do

  create_table "alerts", :force => true do |t|
    t.integer  "patient_id", :null => false
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.integer  "institution_id", :null => false
    t.string   "name",           :null => false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "encrypted_connections", :force => true do |t|
    t.string   "public_key"
    t.string   "private_key"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "patients", :force => true do |t|
    t.integer  "hospital_id",                    :null => false
    t.string   "name"
    t.text     "notes"
    t.date     "arrival_date"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "address"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "telephone"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_relationship"
    t.string   "emergency_contact_telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "institution_id", :null => false
    t.string   "email"
    t.string   "password_hash"
    t.string   "username"
    t.integer  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visit_types", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", :force => true do |t|
    t.integer  "visit_type_id", :null => false
    t.integer  "doctor_id",     :null => false
    t.integer  "patient_id",    :null => false
    t.date     "date"
    t.text     "notes"
    t.decimal  "height"
    t.decimal  "weight"
    t.decimal  "systolic"
    t.decimal  "diastolic"
    t.decimal  "pulse"
    t.decimal  "temperature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
