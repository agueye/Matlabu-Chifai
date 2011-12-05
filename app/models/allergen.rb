class Allergen < ActiveRecord::Base

  validates_presence_of :name
  validate :val_side_effect

  def val_side_effect 
    unless side_effect == nil || type == "Medication" || side_effect == ""
       errors[:base] << "Type is not a Medication and should not access Side effect" 
   end
  end 


end
