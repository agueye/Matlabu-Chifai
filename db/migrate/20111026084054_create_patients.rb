class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :hospital_id, :null => false
      t.string :name
      t.text :notes
      t.date :arrival_date
      t.date :date_of_birth
      t.string :gender
      t.string :address
      t.string :father_name
      t.string :mother_name
      t.string :telephone
      t.string :emergency_contact_name
      t.string :emergency_contact_relationship
      t.string :emergency_contact_telephone

      t.timestamps
    end
  end
end
