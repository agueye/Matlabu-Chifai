class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t| 
      t.string :name, :null => false
      t.text :notes

      t.timestamps
    end
  end
end
