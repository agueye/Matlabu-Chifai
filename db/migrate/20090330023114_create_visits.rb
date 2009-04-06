class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.string :reason
      t.date :dateSeen
      t.string :followUp
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end
