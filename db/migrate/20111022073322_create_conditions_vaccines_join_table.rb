class CreateConditionsVaccinesJoinTable < ActiveRecord::Migration

  def change
    create_table :conditions_vaccines, :id => false do |t|
      t.integer :condition_id
      t.integer :vaccine_id
    end
  end 

#  def up
#  end

#  def down
#  end

end
