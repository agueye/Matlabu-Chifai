class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :patient_id, :null => false
      t.string :title
      t.text :notes

      t.timestamps
    end
  end
end
