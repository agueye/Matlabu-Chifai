class CreateAllergens < ActiveRecord::Migration
  def change
    create_table :allergens do |t|

      t.string :name
      t.text :notes
      t.string :type

      t.timestamps
    end
  end
end
