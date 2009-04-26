class CreatePatientMedications < ActiveRecord::Migration
  def self.up
    create_table :patient_medications do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :medication_id
      t.integer :condition_id
      t.string :dosage
      t.string :frequency
      t.date :date_given
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_medications
  end
end
