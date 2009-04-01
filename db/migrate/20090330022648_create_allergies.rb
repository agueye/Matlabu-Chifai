class CreateAllergies < ActiveRecord::Migration
  def self.up
    create_table :allergies do |t|
      t.string :name
      t.date :dateObserved
      t.string :severity
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :allergies
  end
end
