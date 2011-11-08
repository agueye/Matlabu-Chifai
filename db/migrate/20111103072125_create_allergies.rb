class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.text :reaction
      t.date :recorded

      t.timestamps
    end
  end
end
