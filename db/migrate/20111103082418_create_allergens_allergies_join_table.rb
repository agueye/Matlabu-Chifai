class CreateAllergensAllergiesJoinTable < ActiveRecord::Migration

  def change 
    create_table :allergens_allergies, :id => false do |t|
      t.integer :allergen_id
      t.integer :allergy_id
    end
  end 

#  def up
#  end

#  def down
#  end

end
