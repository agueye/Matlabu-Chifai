class CreatePrescriptions < ActiveRecord::Migration
  def self.up
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.string :name
      t.string :dosage
      t.string :frequency
      t.date :dateGiven

      t.timestamps
    end
  end

  def self.down
    drop_table :prescriptions
  end
end
