class ConditionsPatientsJoinTable < ActiveRecord::Migration
 
 def change
    create_table :conditions_patients, :id => false do |t|
      t.integer :condition_id
      t.integer :patient_id
    end
 end 
#  def up
#  end

#  def down
#  end
end
