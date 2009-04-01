class CreateVaccinations < ActiveRecord::Migration
  def self.up
    create_table :vaccinations do |t|
      t.string :name
      t.date :dateAdmined
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :vaccinations
  end
end
