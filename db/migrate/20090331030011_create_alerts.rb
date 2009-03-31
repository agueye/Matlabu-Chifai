class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.integer :patient_id
      t.date :alert_date
      t.text :alert_note
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
