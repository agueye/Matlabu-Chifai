class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.text :side_effect

      t.timestamps
    end
  end
end
