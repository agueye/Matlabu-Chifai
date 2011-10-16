class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.integer :institution_id, :null => false
      t.string :name, :null => false
      t.text :notes

      t.timestamps
    end
  end
end
