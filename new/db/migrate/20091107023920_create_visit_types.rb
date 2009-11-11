class CreateVisitTypes < ActiveRecord::Migration
  def self.up
    create_table :visit_types do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :visit_types
  end
end
