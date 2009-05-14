class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :medical_record_number
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :arrival_date
      t.date :date_of_birth
      t.string :gender
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :father_first_name
      t.string :father_last_name
      t.string :mother_first_name
      t.string :mother_last_name
      t.string :telephone
      t.string :emergency_contact_name
      t.string :emergency_contact_relationship
      t.string :emergency_contact_number
      t.text :notes
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end

