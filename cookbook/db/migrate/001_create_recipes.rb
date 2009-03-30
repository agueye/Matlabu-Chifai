class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :title, :limit => 100
      t.string :description, :limit => 255
      t.text :instructions
      
      t.references :category
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
