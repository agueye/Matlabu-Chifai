class CreateVisitTypes < ActiveRecord::Migration
  def change
    create_table :visit_types do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
