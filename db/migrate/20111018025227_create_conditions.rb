class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name, :null => false 
      t.text :notes

      t.timestamps
    end
  end
end
