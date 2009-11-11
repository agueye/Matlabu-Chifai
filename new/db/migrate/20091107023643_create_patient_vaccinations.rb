class CreatePatientVaccinations < ActiveRecord::Migration
  def self.up
    create_table :patient_vaccinations do |t|
      t.references :patient
      t.references :vaccination
      t.datetime :date_admined
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_vaccinations
  end
end
