class CreatePatientVisits < ActiveRecord::Migration
  def self.up
    create_table :patient_visits do |t|
      t.references :patient
      t.references :doctor
      t.references :visit_type
      t.references :condition
      t.datetime :visit_date
      t.string :height
      t.string :weight
      t.string :systolic
      t.string :diastolic
      t.string :pulse
      t.string :temperature
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_visits
  end
end
