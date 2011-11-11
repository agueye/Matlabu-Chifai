class ConditionsPrescriptionsJoinTable < ActiveRecord::Migration

 def change
    create_table :conditions_prescriptions, :id => false do |t|
      t.integer :condition_id
      t.integer :prescription_id
    end
 end


#  def up
#  end

#  def down
#  end
end
