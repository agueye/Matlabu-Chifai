class CreatePatientVisits < ActiveRecord::Migration
  def self.up
    create_table :patient_visits do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :visit_type_id
      t.integer :condition_id
      t.date :visit_date
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
