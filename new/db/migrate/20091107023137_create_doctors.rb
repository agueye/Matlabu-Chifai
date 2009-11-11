class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :doctors
  end
end
