class CreatePatientAlerts < ActiveRecord::Migration
  def self.up
    create_table :patient_alerts do |t|
      t.integer :patient_id
      t.date :alert_date
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_alerts
  end
end
