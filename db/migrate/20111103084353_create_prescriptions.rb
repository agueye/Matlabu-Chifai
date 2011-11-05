class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.text :notes
      t.date :prescibed
      t.date :start
      t.date :end
      t.string :dosage
      t.string :frequency

      t.timestamps
    end
  end
end
