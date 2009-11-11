class CreatePatientAllergies < ActiveRecord::Migration
  def self.up
    create_table :patient_allergies do |t|
      t.references :allergy
      t.references :patient
      t.datetime :date_observed
      t.string :severity
      t.string :reaction
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_allergies
  end
end
