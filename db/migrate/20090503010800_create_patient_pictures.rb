class CreatePatientPictures < ActiveRecord::Migration
  def self.up
    create_table :patient_pictures do |t|
      t.integer :patient_id
      t.binary :picture
      
      t.timestamp
    end
  end

  def self.down
    drop_table :patient_pictures
  end
end