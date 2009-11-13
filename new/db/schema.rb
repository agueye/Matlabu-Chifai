# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091113223946) do

  create_table "allergies", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conditions", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medications", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_alerts", :force => true do |t|
    t.integer  "patient_id"
    t.datetime "alert_date"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_allergies", :force => true do |t|
    t.integer  "allergy_id"
    t.integer  "patient_id"
    t.datetime "date_observed"
    t.string   "severity"
    t.string   "reaction"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_medications", :force => true do |t|
    t.integer  "medication_id"
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.integer  "condition_id"
    t.datetime "date_given"
    t.string   "dosage"
    t.string   "frequency"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_notes", :force => true do |t|
    t.integer  "patient_id"
    t.datetime "note_date"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_vaccinations", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "vaccination_id"
    t.datetime "date_admined"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_visits", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.integer  "visit_type_id"
    t.integer  "condition_id"
    t.datetime "visit_date"
    t.string   "height"
    t.string   "weight"
    t.string   "systolic"
    t.string   "diastolic"
    t.string   "pulse"
    t.string   "temperature"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "medical_record_number"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "arrival_date"
    t.datetime "dob"
    t.string   "gender"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "father_first_name"
    t.string   "father_last_name"
    t.string   "mother_first_name"
    t.string   "mother_last_name"
    t.string   "telephone"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_relation"
    t.string   "emergency_contact_number"
    t.text     "notes"
    t.string   "photo_file_url"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "vaccinations", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visit_types", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
