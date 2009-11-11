class CreatePatientMedications < ActiveRecord::Migration
  def self.up
    create_table :patient_medications do |t|
      t.references :medication
      t.references :patient
      t.references :doctor
      t.references :condition
      t.datetime :date_given
      t.string :dosage
      t.string :frequency
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_medications
  end
end
