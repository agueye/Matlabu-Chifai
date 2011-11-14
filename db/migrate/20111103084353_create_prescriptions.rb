class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.text :notes
      t.date :prescibed
      t.date :start
      t.date :end
      t.string :dosage
      t.string :frequency
      t.integer :doctor_id
      t.integer :condition_id
      t.integer :medication_id  
      t.integer :patient_id
   
      t.timestamps
    end
  end
end
