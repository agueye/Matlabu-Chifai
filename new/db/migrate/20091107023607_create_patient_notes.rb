class CreatePatientNotes < ActiveRecord::Migration
  def self.up
    create_table :patient_notes do |t|
      t.references :patient
      t.datetime :note_date
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_notes
  end
end
