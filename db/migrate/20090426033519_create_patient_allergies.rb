class CreatePatientAllergies < ActiveRecord::Migration
  def self.up
    create_table :patient_allergies do |t|
      t.integer :patient_id
      t.integer :allergy_id
      t.date :date_observed
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
